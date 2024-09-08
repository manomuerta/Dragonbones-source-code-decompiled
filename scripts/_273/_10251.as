package _273
{
   import _1404._1407;
   import _18.IAction;
   import _54._67;
   import _555._556;
   import _586._589;
   import _586._605;
   import _644._646;
   import _93._92;
   
   public class _10251 extends _92
   {
      public function _10251()
      {
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:_67 = null;
         super._1572(param1);
         _2223.oldValue = [];
         for each(_loc2_ in this.tweens)
         {
            _2223.oldValue.push(_loc2_.easing);
         }
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_10251 = param1 as _10251;
         if(Boolean(_loc2_) && _loc2_.tweens == this.tweens)
         {
            _2223.newValue = _loc2_.newValue;
            return true;
         }
         return false;
      }
      
      override public function execute() : void
      {
         var _loc1_:_67 = null;
         super.execute();
         for each(_loc1_ in this.tweens)
         {
            _loc1_.easing = this.newValue as int;
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc2_:_67 = null;
         super.revert();
         var _loc1_:int = 0;
         while(_loc1_ < this.tweens.length)
         {
            _loc2_ = this.tweens[_loc1_];
            _loc2_.easing = this.oldValue[_loc1_];
            _loc1_++;
         }
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
      
      public function get newValue() : Object
      {
         return _2223.newValue;
      }
      
      private function get oldValue() : Object
      {
         return _2223.oldValue;
      }
      
      public function get tweens() : Vector.<_67>
      {
         return _2223.tweens as Vector.<_67>;
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

