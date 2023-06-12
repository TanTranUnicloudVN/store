import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';

@Openapi(
  additionalProperties: DioProperties(pubName: 'api'),
  inputSpecFile: 'packages/api/specs/api.json',
  outputDirectory: 'packages/api/service',
  generatorName: Generator.dio,
  alwaysRun: true,
)
class IBPosConfig extends OpenapiGeneratorConfig {}
