abstract class EventBlocProduct {}

class EventProductSort extends EventBlocProduct {
  final String sort;

  EventProductSort(this.sort);
}

class EventProductSortByCategory extends EventBlocProduct {
  final String category;

  EventProductSortByCategory(this.category);
}

class EventProductSortByRating extends EventBlocProduct {
  final double rating;

  EventProductSortByRating(this.rating);
}
