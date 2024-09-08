package _1148
{
   import _1174._1173;
   import _1174._1175;
   import egret.core.ns_egret;
   
   use namespace ns_egret;
   
   public class _1150
   {
      public var property:String;
      
      public var _8759:_1173;
      
      public var _8781:Vector.<_1149>;
      
      public function _1150(param1:String = null)
      {
         this._8759 = _1175.getInstance();
         super();
         this.property = param1;
      }
      
      public function clone() : _1150
      {
         var _loc2_:int = 0;
         var _loc1_:_1150 = new _1150(this.property);
         _loc1_._8759 = this._8759;
         if(this._8781 !== null)
         {
            _loc1_._8781 = new Vector.<_1149>();
            _loc2_ = 0;
            while(_loc2_ < this._8781.length)
            {
               _loc1_._8781[_loc2_] = this._8781[_loc2_].clone();
               _loc2_++;
            }
         }
         return _loc1_;
      }
      
      ns_egret function _8796(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:_1149 = null;
         var _loc2_:int = int(this._8781.length);
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this._8781[_loc3_];
            _loc4_.ns_egret::_8821 = _loc4_.time / param1;
            _loc3_++;
         }
      }
      
      public function getValue(param1:Number) : Object
      {
         var _loc6_:Number = NaN;
         var _loc7_:_1149 = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(!this._8781)
         {
            return null;
         }
         var _loc2_:int = int(this._8781.length);
         if(_loc2_ == 2 && this._8781[1].ns_egret::_8821 == 1)
         {
            _loc6_ = this._8781[1]._3772 != null ? this._8781[1]._3772.ease(param1) : param1;
            return this._8759.interpolate(_loc6_,this._8781[0].value,this._8781[1].value);
         }
         if(isNaN(this._8781[0].ns_egret::_8821))
         {
            this.ns_egret::_8796(this._8781[this._8781.length - 1].time);
         }
         var _loc3_:Number = 0;
         var _loc4_:Object = this._8781[0].value;
         var _loc5_:int = 1;
         while(_loc5_ < _loc2_)
         {
            _loc7_ = this._8781[_loc5_];
            if(param1 >= _loc3_ && param1 < _loc7_.ns_egret::_8821)
            {
               _loc8_ = (param1 - _loc3_) / (_loc7_.ns_egret::_8821 - _loc3_);
               _loc9_ = _loc7_._3772 != null ? _loc7_._3772.ease(_loc8_) : _loc8_;
               return this._8759.interpolate(_loc9_,_loc4_,_loc7_.value);
            }
            _loc3_ = _loc7_.ns_egret::_8821;
            _loc4_ = _loc7_.value;
            _loc5_++;
         }
         return this._8781[_loc2_ - 1].value;
      }
   }
}

