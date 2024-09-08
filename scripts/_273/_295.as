package _273
{
   import _1404._1407;
   import _18.IAction;
   import _54._57;
   import _54._67;
   import _555._556;
   import _586._589;
   import _586._605;
   import _644._646;
   import _93._92;
   
   public class _295 extends _92
   {
      public function _295()
      {
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         _2223.oldValue = this._2071.during;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_295 = param1 as _295;
         if(Boolean(_loc2_) && _loc2_._2071 == this._2071)
         {
            _2223.newValue = _loc2_.newValue;
            return true;
         }
         return false;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2071.during = this.newValue as Number;
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2071.during = this.oldValue as Number;
         this._2894();
      }
      
      private function _2894() : void
      {
         if(this._3077)
         {
            this._3058._3076(this._3077);
         }
         this._3113._3115();
         this._3056.refresh();
      }
      
      public function get newValue() : Number
      {
         return _2223.newValue;
      }
      
      private function get oldValue() : Number
      {
         return _2223.oldValue;
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
      
      protected function get _3113() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
      
      protected function get _3056() : _556
      {
         return _1407.getInstance(_556) as _556;
      }
   }
}

