package component;

import flow.*;

class TriggerWrapper<T> implements Trigger<T>
{
    var startFn:((T) -> Void) -> Void;
    var emitter:Emitter<T>;

    public function new (startFn:((T) -> Void) -> Void)
    {
        this.startFn = startFn;
        this.emitter = new EmitterWrapper();
    }

    public function to(receiver:Receiver<T>)
    {
        emitter.to(receiver);
    }

    public function toFilterTypes<V>(receiver:Receiver<V>)
    {
        emitter.toFilterTypes(receiver);
    }

    public function start()
    {
        startFn(emit);
    }

    public function emit(signal:Dynamic):Void
    {
        emitter.emit(signal);
    }
}