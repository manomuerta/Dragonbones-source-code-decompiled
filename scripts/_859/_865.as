package _859
{
   import _724._14087;
   import _724._725;
   import _724._726;
   import egret.core._1140;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _865 extends _1140 implements _860, _858
   {
      protected static var _3689:Matrix = new Matrix();
      
      private var _5741:Boolean;
      
      private var _5740:Boolean;
      
      private var _6359:_725;
      
      private var _5253:Rectangle;
      
      private var _6361:Bitmap;
      
      public function _865()
      {
         super();
         this._6361 = new Bitmap();
      }
      
      public function set _2104(param1:_725) : void
      {
         if(this._6359 != param1 || this._6359 != null)
         {
            if(this._6359 != null)
            {
               this._6359._5725(this);
            }
            this._6359 = param1;
            if(this._6359 != null)
            {
               if(this._6359 is _726)
               {
                  this._6359 = param1 as _726;
                  this._6359._5735(this);
               }
               else if(this._6359 is _14087)
               {
                  this._6359 = param1 as _14087;
                  this._6359._5735(this);
               }
            }
         }
      }
      
      public function set _5724(param1:Object) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Rectangle = null;
         var _loc4_:BitmapData = null;
         graphics.clear();
         removeChildren();
         if(param1 != null)
         {
            if(param1 is Sprite)
            {
               _loc2_ = param1 as Sprite;
               _loc3_ = _loc2_.getBounds(_loc2_);
               _loc2_.x = -_loc3_.width / 2 - _loc3_.x;
               _loc2_.y = -_loc3_.height / 2 - _loc3_.y;
               (this as Sprite).addChild(_loc2_);
            }
            else if(param1 is BitmapData)
            {
               _loc4_ = param1 as BitmapData;
               _3689.setTo(1,0,0,1,0,0);
               _3689.tx = -_loc4_.width / 2;
               _3689.ty = -_loc4_.height / 2;
               graphics.beginBitmapFill(_loc4_,_3689,false,true);
               graphics.drawRect(-_loc4_.width / 2,-_loc4_.height / 2,_loc4_.width,_loc4_.height);
            }
         }
         this._5253 = getBounds(this);
      }
      
      public function set _5747(param1:Boolean) : void
      {
         this._5741 = param1;
      }
      
      public function get _5747() : Boolean
      {
         return this._5741;
      }
      
      public function set _5744(param1:Boolean) : void
      {
         this._5740 = param1;
      }
      
      public function get _5744() : Boolean
      {
         return this._5740;
      }
      
      public function get AABB() : Rectangle
      {
         return this._5253;
      }
      
      public function get matrix() : Matrix
      {
         return transform.matrix;
      }
      
      public function dispose() : void
      {
         this._6359 = null;
         this._6361 = null;
      }
   }
}

