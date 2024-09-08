package _477
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Graphics;
   import flash.display.IBitmapDrawable;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _14068 extends _494
   {
      private var _5455:BitmapData;
      
      private var _3707:Function;
      
      public function _14068(param1:Function)
      {
         super();
         this._3707 = param1;
         this._14491();
      }
      
      override public function run() : void
      {
         var _loc1_:Array = null;
         var _loc2_:BitmapData = null;
         var _loc3_:Object = null;
         var _loc4_:Boolean = false;
         var _loc6_:IBitmapDrawable = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:DisplayObject = null;
         var _loc12_:Rectangle = null;
         if(!_3238.exportTexture)
         {
            complete();
            return;
         }
         _loc1_ = _3613._3609.images;
         var _loc5_:Matrix = new Matrix();
         this._2222 = new Vector.<BitmapData>();
         _loc7_ = 0;
         _loc8_ = int(_loc1_.length);
         while(_loc7_ < _loc8_)
         {
            _loc3_ = _loc1_[_loc7_];
            _loc9_ = _loc3_.assetData.width * _3238.scale;
            _loc10_ = _loc3_.assetData.height * _3238.scale;
            if(_loc9_ <= 0)
            {
               _loc9_ = 1;
            }
            if(_loc10_ <= 0)
            {
               _loc10_ = 1;
            }
            _loc2_ = this._14490(_loc9_,_loc10_);
            _loc4_ = _3238.scale != 1 && _3238.smooth;
            _loc5_.identity();
            _loc6_ = _loc3_.assetData as IBitmapDrawable;
            if(_loc6_ is Sprite)
            {
               _loc11_ = _loc6_ as DisplayObject;
               _loc12_ = _loc11_.getBounds(_loc11_);
               _loc5_.tx -= _loc12_.x;
               _loc5_.ty -= _loc12_.y;
            }
            if(_3238.scale != 1)
            {
               _loc5_.scale(_3238.scale,_3238.scale);
            }
            _loc2_.draw(_loc6_,_loc5_,null,null,null,_loc4_);
            this._2222.push(_loc2_);
            _loc7_++;
         }
         if(this._3707 != null)
         {
            this._3707(this._2222);
         }
         complete();
      }
      
      private function _14490(param1:Number, param2:Number) : BitmapData
      {
         var _loc3_:Sprite = new Sprite();
         var _loc4_:Matrix = new Matrix();
         var _loc5_:Number = 1;
         _loc4_.scale(_loc5_,_loc5_);
         var _loc6_:Graphics = _loc3_.graphics;
         _loc6_.clear();
         _loc6_.beginBitmapFill(this._5455);
         _loc6_.drawRect(0,0,param1,param2);
         _loc6_.endFill();
         var _loc7_:BitmapData = new BitmapData(param1,param2,true,16777215);
         _loc7_.draw(_loc3_);
         return _loc7_;
      }
      
      private function _14491() : void
      {
         var _loc1_:Number = 20;
         var _loc2_:Number = 20;
         var _loc3_:Shape = new Shape();
         _loc3_.graphics.beginFill(5855326);
         _loc3_.graphics.drawRect(0,0,_loc2_ * 2,_loc2_ * 2);
         _loc3_.graphics.beginFill(6513256);
         _loc3_.graphics.drawRect(0,0,_loc2_,_loc2_);
         _loc3_.graphics.drawRect(_loc2_,_loc2_,_loc2_,_loc2_);
         _loc3_.graphics.endFill();
         this._5455 = new BitmapData(_loc1_ * 2,_loc1_ * 2);
         this._5455.draw(_loc3_);
      }
   }
}

