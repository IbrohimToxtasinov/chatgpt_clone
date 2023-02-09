class ChatGpt {
  String questionText;
  String answerText;
  String createdTime;

  ChatGpt({
    required this.answerText,
    required this.createdTime,
    required this.questionText,
  });

  static List<ChatGpt> unknown = [
    ChatGpt(
        answerText: 'chat Gpt',
        createdTime: '10:00',
        questionText: 'isming nima'),
    ChatGpt(
        answerText: 'Odam san',
        createdTime: '14:00',
        questionText: 'men kimman'),
    ChatGpt(
        answerText: 'Teng keladigani yuq oka',
        createdTime: '8:00',
        questionText: 'flutter zurmi'),
    ChatGpt(
        answerText: 'Hello',
        createdTime: '8:00',
        questionText: 'hello'),
    ChatGpt(
        answerText: 'I am fine and You',
        createdTime: '8:00',
        questionText: 'how are you'),
  ];
}