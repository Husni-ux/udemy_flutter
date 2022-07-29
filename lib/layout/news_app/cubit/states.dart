abstract class NewStates {}

class NewsInitialState extends NewStates {}

class NewsBottomNavState extends NewStates {}



class NewsGetBusinessLoadingState extends NewStates {}

class NewsGetBusinessSuccessState extends NewStates {}

class NewsErrorBusinessState extends NewStates {
  final String error;

  NewsErrorBusinessState(this.error);
}
class NewsGetSportsLoadingState extends NewStates {}

class NewsGetSportsSuccessState extends NewStates {}

class NewsErrorSportsState extends NewStates {
  final String error;

  NewsErrorSportsState(this.error);
}
class NewsGetScienceLoadingState extends NewStates {}

class NewsGetScienceSuccessState extends NewStates {}

class NewsErrorScienceState extends NewStates {
  final String error;

  NewsErrorScienceState(this.error);
}
class NewsGetSettingsLoadingState extends NewStates {}

class NewsGetSettingsSuccessState extends NewStates {}

class NewsErrorSettingsState extends NewStates {
  final String error;

  NewsErrorSettingsState(this.error);
}
