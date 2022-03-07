class BaseEvent{}

class EventRequest<T> extends BaseEvent{
  T request;
  EventRequest(this.request);
}

class EventOnSuccess<T> extends BaseEvent{
  T response;
  EventOnSuccess(this.response);
}

class EventOnFailure<T> extends BaseEvent{
  T failure;
  EventOnFailure(this.failure);
}