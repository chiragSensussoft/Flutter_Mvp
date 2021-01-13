class BasePresenter<T>{
  T view;

  void attachView(T view){
    this.view=view;
  }

  bool get isViewAttached{
    return view!=null;
  }
  
  T getView(){
    return view;
  }

}