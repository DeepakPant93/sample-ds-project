from sample_ds_project.logging import logger

STAGE_NAME = "Data Transformation Stage"


class DataTransformationTrainingPipeline:
    def __init__(self) -> None:
        """This class shall be used for data transformation pipeline.

        __init__ is the constructor method of class.
        """
        pass

    def run(self) -> None:
        """
        This method executes the main data transformation pipeline process.

        It orchestrates the data transformation tasks to transform the
        data which was prepared in the previous stage.
        """
        pass


if __name__ == "__main__":
    try:
        logger.info(f">>>>>> stage {STAGE_NAME} started <<<<<<")
        obj = DataTransformationTrainingPipeline()
        obj.run()
        logger.info(f">>>>>> stage {STAGE_NAME} completed <<<<<<\n\nx==========x")
    except Exception as e:
        logger.exception(e)
        raise
