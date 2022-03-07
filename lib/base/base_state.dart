class BaseState{

}

class StateOnSuccess<T> extends BaseState{
  T response;
  StateOnSuccess(this.response);
}

class StateOnFailure<T> extends BaseState{
  T failure;
  StateOnFailure(this.failure);
}

class StateInitialFeed extends BaseState{

}