from mage_ai.settings.repo import get_repo_path
from mage_ai.io.config import ConfigFileLoader
from mage_ai.io.bigquery import BigQuery
from pandas import DataFrame
from os import path

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

dataframe_names = [
    "datetime_dim", "passenger_count_dim", "trip_distance_dim",
    "rate_code_dim", "location_dim", "payment_type_dim", "fact_table"
]

@data_exporter
def export_data_to_google_cloud_storage(dataframes: list, **kwargs) -> None:
    """
    Template for exporting data to a Google Cloud Storage bucket.
    Specify your configuration settings in 'io_config.yaml'.

    """
    config_path = path.join(get_repo_path(), 'io_config.yaml')
    config_profile = 'default'
    for df, name in zip(dataframes, dataframe_names):
        table_id = ''#projectid.datasetid.table
        BigQuery.with_config(ConfigFileLoader(config_path, config_profile)).export(
            DataFrame(df),
            table_id,
            if_exists='replace',  # Specify resolution policy if table name already exists
        )
