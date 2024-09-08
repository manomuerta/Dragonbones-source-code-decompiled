package _127
{
   import _1177.UIEvent;
   import _1374._1392;
   
   public class _144 extends _1392
   {
      private var _2537:Boolean = false;
      
      private var _2535:Object;
      
      private var _2533:Object;
      
      public function _144()
      {
         super();
         this.addEventListener(UIEvent.VALUE_COMMIT,this._2532);
         this.skinName = _145;
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == _2448)
         {
            this._2538();
         }
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._2537)
         {
            this._2537 = false;
            this._2538();
         }
      }
      
      private function _2532(param1:UIEvent) : void
      {
         this._2531();
      }
      
      private function _2538() : void
      {
         if(_2448)
         {
            _2448.source = this.selected ? this._2536 : this._2534;
         }
      }
      
      private function _2531() : void
      {
         this._2537 = true;
         _2466();
      }
      
      public function get _2536() : Object
      {
         return this._2535;
      }
      
      public function set _2536(param1:Object) : void
      {
         if(this._2535 == param1)
         {
            return;
         }
         this._2535 = param1;
         this._2531();
      }
      
      public function get _2534() : Object
      {
         return this._2533;
      }
      
      public function set _2534(param1:Object) : void
      {
         if(this._2533 == param1)
         {
            return;
         }
         this._2533 = param1;
         this._2531();
      }
   }
}

