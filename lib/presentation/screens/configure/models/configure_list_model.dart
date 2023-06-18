import 'configuration_model.dart';

class ConfigureListMode {
  ConfigurationModel amount = ConfigurationModel(
    question: 'Number of Questions:',
    value: '10',
    hint: 'Enter Number',
  );

  ConfigurationModel category = ConfigurationModel(
    question: 'Select Category:',
    value: 'Any Category',
    hint: 'Select Category',
  );

  ConfigurationModel difficulty = ConfigurationModel(
    question: 'Select Difficulty:',
    value: 'Any Difficulty',
    hint: 'Select Difficulty',
  );
}
