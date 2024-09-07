class Prompt{
  Prompt({required this.prompt, this.response = ''});

  final String prompt;
  final String response;

  Prompt copyWith({String? prompt, String? response}){
    return Prompt(
      prompt: prompt ?? this.prompt,
      response: response ?? this.response
    );
  }

  Prompt answerPrompt(String response){
    return Prompt(
      prompt: prompt,
      response: response
    );
  }
}