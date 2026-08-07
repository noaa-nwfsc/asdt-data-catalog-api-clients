.. NWFSC Data Catalog Python SDK documentation master file, created by
   sphinx-quickstart on Wed Jul 01 12:00:00 2026.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Welcome to the NWFSC Data Catalog Python SDK!
=============================================

This site provides the official documentation for the auto-generated Python client,
which provides access to all API endpoints and data models for the NWFSC Data Catalog.
The SDK is generated directly from the project's OpenAPI specification.

.. raw:: html

   <style> .bd-sidebar-secondary { display: none; } </style>

Installation
------------

The Python SDK is distributed as a `.whl` file, which is attached to each
`GitHub Release <https://github.com/NOAA-NWFSC/asdt-data-catalog-api-clients/releases>`_.

You can install it directly using `pip`:

.. code-block:: bash

   # Replace {version} with the desired release version (e.g., 1.0.0)
   pip install https://github.com/NOAA-NWFSC/asdt-data-catalog-api-clients/releases/download/v{version}/nwfsc_data_catalog-{version}-py3-none-any.whl


Quick Start
-----------

To get started, instantiate the API client. All API calls are accessible
through the `ApiClient` instance.

.. code-block:: python

   import nwfsc_data_catalog
   from nwfsc_data_catalog.rest import ApiException

   # Configure the client
   # You can also customize host, authentication, etc.
   configuration = nwfsc_data_catalog.Configuration()

   # Create an instance of the API class
   with nwfsc_data_catalog.ApiClient(configuration) as api_client:
       # Create an instance of the default API
       api_instance = nwfsc_data_catalog.DefaultApi(api_client)

       try:
           # Example: list all public data catalog items
           api_response = api_instance.list_public_data_catalog()
           print("The response of DefaultApi->list_public_data_catalog:\n")
           print(api_response)
       except ApiException as e:
           print("Exception when calling DefaultApi->list_public_data_catalog: %s\n" % e)


.. toctree::
   :maxdepth: 1
   :caption: Contents:

   modules


Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
