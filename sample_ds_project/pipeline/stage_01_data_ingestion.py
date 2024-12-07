from sample_ds_project.logging import logger

STAGE_NAME = "Data Ingestion Stage"


class DataIngestionTrainingPipeline:
    def __init__(self) -> None:
        """This class shall be used for data ingestion pipeline.

        __init__ is the constructor method of class.
        """
        pass

    def run(self) -> None:
        """
        This method executes the main data ingestion pipeline process.

        It orchestrates the data ingestion tasks to collect and
        prepare data for further processing in the pipeline.
        """
        pass


if __name__ == "__main__":
    try:
        logger.info(f">>>>>> stage {STAGE_NAME} started <<<<<<")
        obj = DataIngestionTrainingPipeline()
        obj.run()
        logger.info(f">>>>>> stage {STAGE_NAME} completed <<<<<<\n\nx==========x")
    except Exception as e:
        logger.exception(e)
        raise
