import 'package:google_keep_arfoon/features/label/domain/models/label_model.dart';
import '../../features/create_note/domain/models/notes_model.dart';

List<Notes> mockLabelsList = [
  const Notes(
    id: 1,
    title: 'Shopping List',
    noteContent: 'Milk, Eggs, Bread, Butter, Cheese',
    label: [
      Label(id: 1, name: 'Personal'),
      Label(id: 2, name: 'Groceries')
    ],
  ),
  const Notes(
    id: 2,
    title: 'Work Meeting Notes',
    noteContent: 'Discuss project timelines, assign tasks, and set up deadlines.',
    label: [
      Label(id: 3, name: 'Work'),
      Label(id: 4, name: 'Important')
    ],
  ),
  const Notes(
    id: 3,
    title: 'Vacation Ideas',
    noteContent: 'Paris, Italy, Tokyo, Bali',
    label: [
      Label(id: 5, name: 'Travel'),
    ],
  ),
  const Notes(
    id: 4,
    title: 'Fitness Goals',
    noteContent: '1. Run 5km, 2. Drink 2 liters of water, 3. Eat more veggies',
    label: [
      Label(id: 6, name: 'Health'),
    ],
  ),
  const Notes(
    id: 5,
    title: 'Grocery List - Weekend',
    noteContent: 'Tomatoes, Cucumbers, Garlic, Chicken',
    label: [
      Label(id: 2, name: 'Groceries'),
    ],
  ),
  const Notes(
    id: 6,
    title: 'Reading List',
    noteContent: '1. The Great Gatsby, 2. To Kill a Mockingbird, 3. 1984',
    label: [
      Label(id: 7, name: 'Books'),
    ],
  ),
  const Notes(
    id: 7,
    title: 'Project Ideas',
    noteContent: 'Start a blog, Create an app, Launch a YouTube channel',
    label: [
      Label(id: 8, name: 'Personal'),
      Label(id: 3, name: 'Work'),
    ],
  ),
  const Notes(
    id: 8,
    title: 'Birthday Gift Ideas',
    noteContent: 'Laptop, Watch, Headphones, Gift card',
    label: [
      Label(id: 9, name: 'Gifts'),
    ],
  ),
];


List<Notes> getFakeNotes() {
  return mockLabelsList;
}
