import '../../features/label/domain/models/label_model.dart';

List<Label> mockLabelsList = [
  const Label(id: 1, name: 'Personal'),
  const Label(id: 2, name: 'Work'),
  const Label(id: 3, name: 'Important'),
  const Label(id: 4, name: 'Groceries'),
  const Label(id: 5, name: 'Health'),
  const Label(id: 6, name: 'Travel'),
  const Label(id: 7, name: 'Books'),
  const Label(id: 8, name: 'Technology'),
  const Label(id: 9, name: 'Ideas'),
  const Label(id: 10, name: 'Gifts'),
  const Label(id: 11, name: 'Family'),
  const Label(id: 12, name: 'Friends'),
];

// Mock function to fetch labels
List<Label> fetchMockLabels() {
  return mockLabelsList;
}
