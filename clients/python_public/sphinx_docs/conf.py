import os
import sys

# -- Path setup --------------------------------------------------------------
sys.path.insert(0, os.path.abspath("../src"))

# -- Project information -----------------------------------------------------
project = "NWFSC Data Catalog Python SDK"
copyright = "2026, NOAA Fisheries"
author = "NOAA Fisheries"

# -- General configuration ---------------------------------------------------
extensions = [
    "sphinx.ext.autodoc",
    "sphinx.ext.napoleon",
    "sphinx.ext.viewcode",
]

templates_path = ["_templates"]
exclude_patterns = ["_build", "Thumbs.db", ".DS_Store"]

# -- Options for HTML output -------------------------------------------------
html_theme = "pydata_sphinx_theme"
html_static_path = ["_static"]
html_css_files = ["custom.css"]

html_theme_options = {
    "show_prev_next": False,
    "header_links_before_dropdown": 4,
    "navbar_align": "left",
    "primary_sidebar_end": ["indices.html", "sidebar-ethical-ads.html"],
}

# -- Autodoc & Napoleon Settings ---------------------------------------------
autodoc_typehints = "description"
autodoc_default_options = {
    "members": True,
    "undoc-members": True,
    "show-inheritance": True,
}
