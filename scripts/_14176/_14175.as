package _14176
{
   public class _14175 extends _14186
   {
      public var _14639:Number = 0;
      
      public var _14638:Number = 0;
      
      public var _15176:Number = 0;
      
      public var _15177:Boolean = false;
      
      public var _15178:Boolean = false;
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var absolute:Boolean = false;
      
      public function _14175(param1:Boolean = false, param2:Number = 0, param3:Number = 0, param4:Number = 0, param5:Boolean = false, param6:Boolean = false, param7:Number = 0, param8:Number = 0)
      {
         super();
         this.absolute = param1;
         this._14639 = param2;
         this._14638 = param3;
         this._15176 = param4;
         this._15177 = param5;
         this._15178 = param6;
         this.x = param7;
         this.y = param8;
      }
      
      override public function get type() : String
      {
         return this.absolute ? "A" : "a";
      }
      
      override public function clone() : _14186
      {
         var _loc1_:_14175 = new _14175(this.absolute);
         _loc1_._14639 = this._14639;
         _loc1_._14638 = this._14638;
         _loc1_._15176 = this._15176;
         _loc1_._15177 = this._15177;
         _loc1_._15178 = this._15178;
         _loc1_.x = this.x;
         _loc1_.y = this.y;
         return _loc1_;
      }
   }
}

