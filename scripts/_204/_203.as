package _204
{
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.IBitmapDrawable;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _203
   {
      public static const MAX_BITMAP_WIDTH:int = 4096;
      
      public static const MAX_BITMAP_HEIGHT:int = 4096;
      
      public function _203()
      {
         super();
      }
      
      public static function _2795(param1:BitmapData, param2:Object) : Object
      {
         var _loc4_:String = null;
         var _loc5_:Rectangle = null;
         var _loc6_:Matrix = null;
         var _loc7_:BitmapData = null;
         var _loc3_:Object = {};
         for(_loc4_ in param2)
         {
            _loc5_ = param2[_loc4_];
            if(Boolean(_loc5_.width) && Boolean(_loc5_.height))
            {
               (_loc6_ = new Matrix()).tx = -_loc5_.x;
               _loc6_.ty = -_loc5_.y;
               _loc7_ = new BitmapData(_loc5_.width,_loc5_.height,true,16711935);
               _loc7_.draw(param1,_loc6_);
               _loc3_[_loc4_] = _loc7_;
            }
         }
         return _loc3_;
      }
      
      public static function _2796(param1:Object, param2:Object, param3:uint, param4:uint, param5:Number = 1) : BitmapData
      {
         var _loc8_:String = null;
         var _loc9_:IBitmapDrawable = null;
         var _loc10_:Rectangle = null;
         var _loc11_:Matrix = null;
         var _loc12_:DisplayObject = null;
         var _loc13_:Rectangle = null;
         if(param3 > MAX_BITMAP_WIDTH || param4 > MAX_BITMAP_HEIGHT)
         {
            param3 = uint(MAX_BITMAP_WIDTH);
            param4 = uint(MAX_BITMAP_HEIGHT);
         }
         var _loc6_:BitmapData = new BitmapData(param3,param4,true,16711935);
         var _loc7_:* = param5 != 1;
         for(_loc8_ in param1)
         {
            _loc9_ = param1[_loc8_];
            _loc10_ = param2[_loc8_];
            _loc11_ = new Matrix();
            _loc11_.scale(param5,param5);
            _loc11_.tx = _loc10_.x;
            _loc11_.ty = _loc10_.y;
            if(_loc9_ is Sprite)
            {
               _loc12_ = _loc9_ as DisplayObject;
               _loc13_ = _loc12_.getBounds(_loc12_);
               _loc11_.tx -= _loc13_.x * param5;
               _loc11_.ty -= _loc13_.y * param5;
            }
            _loc6_.draw(_loc9_,_loc11_,null,null,_loc10_,_loc7_);
            if(_loc9_ is BitmapData)
            {
               (_loc9_ as BitmapData).dispose();
            }
         }
         return _loc6_;
      }
      
      public static function _2794(param1:Object, param2:Object, param3:uint, param4:uint, param5:Number = 1) : Vector.<BitmapData>
      {
         var _loc7_:Object = null;
         var _loc8_:Vector.<BitmapData> = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc6_:Array = [];
         for each(_loc7_ in param2)
         {
            if(_loc6_[_loc7_.page] == null)
            {
               _loc6_[_loc7_.page] = [];
            }
            _loc6_[_loc7_.page].push(_loc7_);
         }
         _loc8_ = new Vector.<BitmapData>();
         _loc9_ = 0;
         _loc10_ = int(_loc6_.length);
         while(_loc9_ < _loc10_)
         {
            if(_loc6_[_loc9_] != null && _loc6_[_loc9_].length > 0)
            {
               _loc8_.push(_2797(param1,_loc6_[_loc9_],param3,param4,param5));
            }
            _loc9_++;
         }
         return _loc8_;
      }
      
      private static function _2797(param1:Object, param2:Array, param3:uint, param4:uint, param5:Number = 1) : BitmapData
      {
         var _loc10_:Object = null;
         var _loc11_:IBitmapDrawable = null;
         var _loc12_:Rectangle = null;
         var _loc13_:Matrix = null;
         var _loc14_:DisplayObject = null;
         var _loc15_:Rectangle = null;
         if(param3 > MAX_BITMAP_WIDTH || param4 > MAX_BITMAP_HEIGHT)
         {
            param3 = uint(MAX_BITMAP_WIDTH);
            param4 = uint(MAX_BITMAP_HEIGHT);
         }
         var _loc6_:BitmapData = new BitmapData(param3,param4,true,16711935);
         var _loc7_:* = param5 != 1;
         var _loc8_:int = 0;
         var _loc9_:int = int(param2.length);
         while(_loc8_ < _loc9_)
         {
            _loc10_ = param2[_loc8_];
            if((Boolean(_loc10_)) && Boolean(_loc10_.name))
            {
               _loc11_ = param1[_loc10_.name];
               _loc12_ = new Rectangle(_loc10_.x,_loc10_.y,_loc10_.width,_loc10_.height);
               _loc13_ = new Matrix();
               _loc13_.scale(param5,param5);
               _loc13_.tx = _loc12_.x;
               _loc13_.ty = _loc12_.y;
               if(_loc11_ is Sprite)
               {
                  _loc14_ = _loc11_ as DisplayObject;
                  _loc15_ = _loc14_.getBounds(_loc14_);
                  _loc13_.tx -= _loc15_.x * param5;
                  _loc13_.ty -= _loc15_.y * param5;
               }
               _loc6_.draw(_loc11_,_loc13_,null,null,_loc12_,_loc7_);
               if(_loc11_ is BitmapData)
               {
                  (_loc11_ as BitmapData).dispose();
               }
            }
            _loc8_++;
         }
         return _loc6_;
      }
      
      public static function _2793(param1:Object, param2:Function) : void
      {
         new ByteArrayMapToBitmapDataMap(param1,param2);
      }
   }
}

import flash.display.Bitmap;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.system.LoaderContext;
import flash.utils.ByteArray;

class ByteArrayMapToBitmapDataMap
{
   private static var _loaderContext:LoaderContext = new LoaderContext(false);
   
   private static var _holdPool:Vector.<ByteArrayMapToBitmapDataMap> = new Vector.<ByteArrayMapToBitmapDataMap>();
   
   _loaderContext.allowCodeImport = true;
   
   private var _bitmapDataMap:Object;
   
   private var _callback:Function;
   
   public function ByteArrayMapToBitmapDataMap(param1:Object, param2:Function)
   {
      var _loc3_:String = null;
      var _loc4_:ByteArray = null;
      var _loc5_:Loader = null;
      super();
      this._bitmapDataMap = {};
      this._callback = param2;
      for(_loc3_ in param1)
      {
         _loc4_ = param1[_loc3_] as ByteArray;
         if(_loc4_)
         {
            _loc5_ = new Loader();
            _loc5_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.loadBitmapDataHandler);
            _loc5_.loadBytes(_loc4_,_loaderContext);
            this._bitmapDataMap[_loc3_] = _loc5_;
         }
      }
      _holdPool.push(this);
   }
   
   private function loadBitmapDataHandler(param1:Event) : void
   {
      var _loc3_:Boolean = false;
      var _loc5_:String = null;
      var _loc6_:Object = null;
      var _loc2_:LoaderInfo = param1.target as LoaderInfo;
      _loc2_.removeEventListener(Event.COMPLETE,this.loadBitmapDataHandler);
      var _loc4_:Loader = _loc2_.loader;
      for(_loc5_ in this._bitmapDataMap)
      {
         _loc6_ = this._bitmapDataMap[_loc5_];
         if(_loc6_ == _loc4_)
         {
            this._bitmapDataMap[_loc5_] = (_loc2_.content as Bitmap).bitmapData;
         }
         else if(_loc6_ is Loader)
         {
            _loc3_ = true;
         }
      }
      if(!_loc3_)
      {
         if(this._callback != null)
         {
            this._callback(this._bitmapDataMap);
         }
         this._bitmapDataMap = null;
         this._callback = null;
         _holdPool.splice(_holdPool.indexOf(this),1);
      }
   }
}

