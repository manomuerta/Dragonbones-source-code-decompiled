package _13492
{
   import _11489.Curve;
   import _13505._13510;
   import _35.HashObject;
   
   public class _13496 extends HashObject
   {
      public static const TWEEN_NONE:int = 0;
      
      public static const TWEEN_CURVE:int = 2;
      
      public var startPos:int;
      
      public var duration:int;
      
      public var tweenCurve:Curve = null;
      
      protected var _11517:int = 0;
      
      protected var _13662:Boolean;
      
      public var parent:_13510;
      
      public var isFillFirst:Boolean;
      
      public var flag:String;
      
      public var selected:Boolean;
      
      public var _1915:Boolean;
      
      public var _1916:int;
      
      public var _1917:int;
      
      public var _13664:Boolean;
      
      public function _13496()
      {
         super(-1);
      }
      
      public function get _13642() : Boolean
      {
         return this._11517 > 0;
      }
      
      public function get _11515() : Boolean
      {
         return this._11517 === 2 && Boolean(this.tweenCurve) && !this.tweenCurve._14299;
      }
      
      public function get tweenType() : int
      {
         return this._11517;
      }
      
      public function set tweenType(param1:int) : void
      {
         if(!this._13662)
         {
            return;
         }
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
      
      public function get value() : *
      {
         return null;
      }
      
      public function set value(param1:*) : void
      {
      }
      
      public function get _13663() : Boolean
      {
         return this._13662;
      }
      
      public function _1905(param1:Number, param2:_13496, param3:_13496) : _13496
      {
         if(this._11515)
         {
            param1 = this.tweenCurve._11516(param1);
         }
         return this._13660(param1,param2,param3);
      }
      
      protected function _13660(param1:Number, param2:_13496, param3:_13496) : _13496
      {
         return param3;
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
      
      public function copyFrom(param1:_13496) : void
      {
         this.value = param1.value;
         this.startPos = param1.startPos;
         this.duration = param1.duration;
         this._11517 = param1.tweenType;
         this._13662 = param1._13663;
         this.tweenCurve = !!param1.tweenCurve ? param1.tweenCurve.clone() : null;
         this.flag = param1.flag;
         this.parent = param1.parent;
      }
      
      public function clone() : _13496
      {
         return null;
      }
      
      public function _2207(param1:_13496) : Boolean
      {
         return false;
      }
   }
}

