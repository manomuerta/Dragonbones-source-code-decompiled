package _273
{
   import _1404._1407;
   import _18.IAction;
   import _472._473;
   import _54._57;
   import _54._67;
   import _586._589;
   import _586._605;
   import _644._646;
   import _93._92;
   
   public class _277 extends _92
   {
      public function _277()
      {
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_298 = param1 as _298;
         if(Boolean(_loc2_) && _loc2_._2071 == this._2071)
         {
            this._2071.value = _loc2_.newValue;
            return true;
         }
         return false;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2069._2076(this._2071,this._3075);
         this._3077.addTween(this._2071);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2069._2075(this._2071);
         this._3077._2075(this._2071);
         this._2894();
      }
      
      private function _2894() : void
      {
         this._3058._3076(this._3077);
         this._3059._3060();
         this._3073._3063(this._2069.parent.parent);
      }
      
      public function get _3075() : int
      {
         return _2223._3075;
      }
      
      private function get _2069() : _57
      {
         return _2223._2069 as _57;
      }
      
      public function get _2071() : _67
      {
         return _2223._2071 as _67;
      }
      
      private function get _3077() : _646
      {
         return _2223._3077 as _646;
      }
      
      private function get _3058() : _589
      {
         return _1407.getInstance(_589) as _589;
      }
      
      private function get _3059() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
      
      protected function get _3073() : _473
      {
         return this._3059._3055;
      }
   }
}

