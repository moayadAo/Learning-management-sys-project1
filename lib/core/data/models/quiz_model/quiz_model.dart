class Question {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const Question({
    required this.correctAnswerIndex,
    required this.question,
    required this.options,
  });
}

class QuestionInfo{
  static List<Question> questions = [
  const Question(
    question: '1. What is the capital of France?',
    correctAnswerIndex: 1,
    options: [
      'a) Madrid',
      'b) Paris',
      'c) Berlin',
      'd) Rome',
    ],
  ),
  const Question(
    question: '2. In what continent is Brazil located?',
    correctAnswerIndex: 3,
    options: [
      'a) Europe',
      'b) Asia',
      'c) North America',
      'd) South America',
    ],
  ),
  const Question(
    question: '3. What is the largest planet in our solar system?',
    correctAnswerIndex: 1,
    options: [
      'a) Earth',
      'b) Jupiter',
      'c) Saturn',
      'd) Venus',
    ],
  ),
  const Question(
    question: '4. What is the longest river in the world?',
    correctAnswerIndex: 0,
    options: [
      'a) Nile',
      'b) Amazon',
      'c) Mississippi',
      'd) Danube',
    ],
  ),
  const Question(
    question: '5. Who is the main character in the Harry Potter series?',
    correctAnswerIndex: 2,
    options: [
      'a) Hermione Granger',
      'b) Ron Weasley',
      'c) Harry Potter',
      'd) Neville Longbottom',
    ],
  ),
  const Question(
    question: '6. What is the smallest planet in our solar system?',
    correctAnswerIndex: 3,
    options: [
      'a) Venus',
      'b) Mars',
      'c) Earth',
      'd) Mercury',
    ],
  ),
  const Question(
    question: '7. Who wrote the play Romeo and Juliet?',
    correctAnswerIndex: 0,
    options: [
      'a) William Shakespeare',
      'b) Oscar Wilde',
      'c) Jane Austen',
      'd) Charles Dickens',
    ],
  ),
  const Question(
    question: '8. What is the highest mountain in the world?',
    correctAnswerIndex: 1,
    options: [
      'a) Mont Blanc',
      'b) Everest',
      'c) Kilimanjaro',
      'd) Aconcagua',
    ],
  ),
  const Question(
    question:
    '9. What is the name of the famous painting by Leonardo da Vinci that depicts a woman?',
    correctAnswerIndex: 3,
    options: [
      'a) Starry Night',
      'b) The Persistence of Memory',
      'c) The Last Supper',
      'd) Mona Lisa',
    ],
  ),
];}