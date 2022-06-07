abstract class ChatState {
  ChatState();
}

class ChatInitialState extends ChatState{
 ChatInitialState(); 
}

class ChatLoadingState extends ChatState{
 ChatLoadingState(); 
}

class ChatErrorState extends ChatState{
 ChatErrorState(); 
}