package _40
{
   import _11489.Curve;
   import _35.HashObject;
   
   public class _45 extends HashObject
   {
      public var startPos:int;
      
      public var duration:int;
      
      public var _1636:Array;
      
      private var _11517:int = 0;
      
      public var tweenCurve:Curve = null;
      
      public var _1915:Boolean;
      
      public var _1916:int;
      
      public var _1917:int;
      
      public function _45(param1:Boolean, param2:int = 0, param3:Object = null)
      {
         this._1636 = [];
         super(param2,param3);
         this._11517 = param1 ? 1 : 0;
      }
      
      public function get tweenEnabled() : Boolean
      {
         return this._11517 > 0;
      }
      
      public function get _11515() : Boolean
      {
         return this._11517 === 2;
      }
      
      public function get tweenType() : int
      {
         return this._11517;
      }
      
      public function set tweenType(param1:int) : void
      {
         if(this._11517 === param1)
         {
            return;
         }
         this._11517 = param1;
      }
      
      public function get endPos() : int
      {
         return this.startPos + this.duration;
      }
      
      public function set endPos(param1:int) : void
      {
         this.duration = param1 - this.startPos;
      }
      
      public function copyFrom(param1:_45) : void
      {
         this.startPos = param1.startPos;
         this.duration = param1.duration;
         this._11517 = param1.tweenType;
         if(param1.tweenCurve)
         {
            this.tweenCurve = param1.tweenCurve.clone();
         }
         else
         {
            this.tweenCurve = null;
         }
         this._1636.length = 0;
         var _loc2_:uint = 0;
         var _loc3_:uint = param1._1636.length;
         while(_loc2_ < _loc3_)
         {
            this._1636.push(param1._1636[_loc2_].clone());
            _loc2_++;
         }
      }
      
      public function clone() : _45
      {
         var _loc1_:_45 = new _45(this.tweenEnabled);
         _loc1_.copyFrom(this);
         return _loc1_;
      }
      
      public function startDrag() : void
      {
         this._1915 = true;
         this._1917 = this.startPos;
         this._1916 = this.startPos;
      }
      
      public function endDrag() : void
      {
         this._1915 = false;
         this._1917 = this.startPos;
         this.startPos = this._1916;
      }
   }
}

