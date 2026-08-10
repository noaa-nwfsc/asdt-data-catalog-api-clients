import os
import tempfile
import pandas as pd
import numpy as np
import pytest

from nwfsc_data_catalog.assessment_skills import (
    skill_generate_design_index,
    skill_expand_compositions,
    skill_build_ss3,
)

@pytest.fixture
def temp_csv_files():
    temp_dir = tempfile.mkdtemp()
    
    # 1. Create a dummy catch CSV
    catch_df = pd.DataFrame([
        {"year": 2024, "depth_m": 100, "latitude_dd": 45.0, "cpue_kg_per_ha": 10.0},
        {"year": 2024, "depth_m": 150, "latitude_dd": 45.0, "cpue_kg_per_ha": 15.0},
        {"year": 2024, "depth_m": 250, "latitude_dd": 35.0, "cpue_kg_per_ha": 5.0},
    ])
    catch_path = os.path.join(temp_dir, "catch.csv")
    catch_df.to_csv(catch_path, index=False)
    
    # 2. Create a dummy biological CSV
    bio_df = pd.DataFrame([
        {"year": 2024, "length_cm": 30.0, "age_years": 5},
        {"year": 2024, "length_cm": 35.0, "age_years": 6},
    ])
    bio_path = os.path.join(temp_dir, "bio.csv")
    bio_df.to_csv(bio_path, index=False)
    
    # 3. Create a dummy custom strata CSV
    strata_df = pd.DataFrame([
        {"stratum_id": "Shallow_North", "min_depth_m": 55, "max_depth_m": 183, "min_lat": 40.5, "max_lat": 49.0, "area_ha": 1500000},
        {"stratum_id": "Mid_South", "min_depth_m": 183, "max_depth_m": 549, "min_lat": 32.5, "max_lat": 40.5, "area_ha": 2100000},
    ])
    strata_path = os.path.join(temp_dir, "strata.csv")
    strata_df.to_csv(strata_path, index=False)
    
    # 4. Create dummy SS3 dat template
    dat_template_path = os.path.join(temp_dir, "ss3_template.dat")
    with open(dat_template_path, "w") as f:
        f.write("# Dummy SS3 Data File Template\n")
        
    yield catch_path, bio_path, strata_path, dat_template_path, temp_dir
    
    # Clean up
    for root, dirs, files in os.walk(temp_dir, topdown=False):
        for name in files:
            os.remove(os.path.join(root, name))
        for name in dirs:
            os.rmdir(os.path.join(root, name))
    os.rmdir(temp_dir)


def test_skill_generate_design_index(temp_csv_files):
    catch_path, bio_path, strata_path, _, _ = temp_csv_files
    
    index_path = skill_generate_design_index(
        catch_csv_path=catch_path,
        strata_csv_path=strata_path
    )
    
    assert os.path.exists(index_path)
    df = pd.read_csv(index_path)
    assert not df.empty
    assert "biomass_mt" in df.columns
    assert "cv" in df.columns


def test_skill_expand_compositions(temp_csv_files):
    catch_path, bio_path, _, _, _ = temp_csv_files
    
    comps = skill_expand_compositions(
        catch_csv_path=catch_path,
        bio_csv_path=bio_path
    )
    
    assert "length_comps" in comps
    assert "age_comps" in comps
    assert os.path.exists(comps["length_comps"])
    assert os.path.exists(comps["age_comps"])


def test_skill_build_ss3(temp_csv_files):
    catch_path, bio_path, strata_path, dat_path, _ = temp_csv_files
    
    index_path = skill_generate_design_index(catch_path, strata_path)
    comps = skill_expand_compositions(catch_path, bio_path)
    
    out_file = skill_build_ss3(
        dat_template_path=dat_path,
        index_csv_path=index_path,
        length_csv_path=comps["length_comps"]
    )
    
    assert os.path.exists(out_file)
    with open(out_file, "r") as f:
        content = f.read()
    assert "# --- APPENDED VIA NWFSC MCP SKILL ---" in content
