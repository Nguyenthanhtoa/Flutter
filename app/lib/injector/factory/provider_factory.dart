
import 'package:app/injector/factory/factory.dart';
import 'package:app/injector/injector_base.dart';

/// This Factory does lazy instantiation of [T] and
/// always returns a new instance built by the [builder]
class ProviderFactory<T> implements Factory<T> {
  @override
  Builder<T> builder;

  @override
  Injector injector;

  ProviderFactory(this.builder, this.injector);

  @override
  T get instance => builder(injector);
}
