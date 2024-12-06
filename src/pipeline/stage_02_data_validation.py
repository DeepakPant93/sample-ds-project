from src.logging import logger

STAGE_NAME = "Data Validation Stage"


class DataValidationTrainingPipeline:
    def __init__(self) -> None:
        """This class shall be used for data validation pipeline.

        __init__ is the constructor method of class.
        """
        pass

    def run(self) -> None:
        """This method executes the main data validation pipeline process.

        It orchestrates the data validation tasks to validate the data
        received from the data ingestion stage.

        """
        pass


if __name__ == "__main__":
    try:
        logger.info(f">>>>>> stage {STAGE_NAME} started <<<<<<")
        obj = DataValidationTrainingPipeline()
        obj.run()
        logger.info(f">>>>>> stage {STAGE_NAME} completed <<<<<<\n\nx==========x")
    except Exception as e:
        logger.exception(e)
        raise
