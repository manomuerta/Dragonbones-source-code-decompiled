package _477
{
   import _1315._1319;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.IBitmapDrawable;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _489 extends _494
   {
      private var _11142:Boolean = false;
      
      public function _489(param1:Boolean = false)
      {
         super();
         this._11142 = param1;
      }
      
      override public function run() : void
      {
         var _loc2_:BitmapData = null;
         var _loc3_:Object = null;
         var _loc4_:Boolean = false;
         var _loc6_:IBitmapDrawable = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Object = null;
         var _loc13_:DisplayObject = null;
         var _loc14_:Rectangle = null;
         if(!_3238.exportTexture)
         {
            complete();
            return;
         }
         var _loc1_:Array = _3613._3609.images;
         var _loc5_:Matrix = new Matrix();
         var _loc9_:_1319 = new _1319();
         this._2222 = [];
         _loc7_ = 0;
         _loc8_ = int(_loc1_.length);
         while(_loc7_ < _loc8_)
         {
            _loc3_ = _loc1_[_loc7_];
            _loc10_ = _loc3_.assetData.width * _3238.scale;
            _loc11_ = _loc3_.assetData.height * _3238.scale;
            if(_loc10_ <= 0)
            {
               _loc10_ = 1;
            }
            if(_loc11_ <= 0)
            {
               _loc11_ = 1;
            }
            _loc2_ = new BitmapData(_loc10_,_loc11_,true,16777215);
            _loc4_ = _3238.scale != 1 && _3238.smooth;
            _loc5_.identity();
            _loc6_ = _loc3_.assetData as IBitmapDrawable;
            if(_loc6_ is Sprite)
            {
               _loc13_ = _loc6_ as DisplayObject;
               _loc14_ = _loc13_.getBounds(_loc13_);
               _loc5_.tx -= _loc14_.x;
               _loc5_.ty -= _loc14_.y;
            }
            if(_3238.scale != 1)
            {
               _loc5_.scale(_3238.scale,_3238.scale);
            }
            _loc2_.draw(_loc6_,_loc5_,null,null,null,_loc4_);
            _loc12_ = {
               "path":_3613.ouputPath + _3238.outputName + "_texture/" + _loc3_.name + ".png",
               "data":_loc9_.encode(_loc2_)
            };
            _3613._3676.push(_loc12_);
            this._2222.push(_loc12_);
            _loc7_++;
         }
         complete();
      }
   }
}

