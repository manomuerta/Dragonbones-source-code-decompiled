package _11910
{
   import _11845.*;
   import _11846.*;
   import flash.display.*;
   import flash.geom.ColorTransform;
   import flash.geom.Transform;
   
   public class _11942 extends _11944
   {
      public static const API:Number = 2;
      
      protected static var _props:Array = ["redMultiplier","greenMultiplier","blueMultiplier","alphaMultiplier","redOffset","greenOffset","blueOffset","alphaOffset"];
      
      protected var _5659:Transform;
      
      public function _11942()
      {
         super("tint,colorTransform,removeTint");
      }
      
      override public function _12284(param1:Object, param2:*, param3:_11949) : Boolean
      {
         var _loc5_:ColorTransform = null;
         if(!(param1 is DisplayObject))
         {
            return false;
         }
         var _loc4_:ColorTransform = new ColorTransform();
         if(param2 != null && param3.vars.removeTint != true)
         {
            _loc4_.color = uint(param2);
         }
         this._5659 = DisplayObject(param1).transform;
         _loc5_ = this._5659.colorTransform;
         _loc4_.alphaMultiplier = _loc5_.alphaMultiplier;
         _loc4_.alphaOffset = _loc5_.alphaOffset;
         this._init(_loc5_,_loc4_);
         return true;
      }
      
      public function _init(param1:ColorTransform, param2:ColorTransform) : void
      {
         var _loc4_:String = null;
         var _loc3_:int = int(_props.length);
         while(--_loc3_ > -1)
         {
            _loc4_ = _props[_loc3_];
            if(param1[_loc4_] != param2[_loc4_])
            {
               _12285(param1,_loc4_,param1[_loc4_],param2[_loc4_],"tint");
            }
         }
      }
      
      override public function setRatio(param1:Number) : void
      {
         var _loc2_:ColorTransform = this._5659.colorTransform;
         var _loc3_:_11847 = _12334;
         while(_loc3_)
         {
            _loc2_[_loc3_.p] = _loc3_.c * param1 + _loc3_.s;
            _loc3_ = _loc3_._next;
         }
         this._5659.colorTransform = _loc2_;
      }
   }
}

