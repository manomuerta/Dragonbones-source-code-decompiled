package egret.core
{
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   
   use namespace ns_egret;
   
   public class _1110
   {
      private static var helper:BitmapSourceHelper;
      
      private var _8651:Object;
      
      private var _bitmapData:BitmapData;
      
      private var _8650:Dictionary;
      
      private var _8647:Object;
      
      private var _8646:BitmapData;
      
      private var _8645:Dictionary;
      
      private var _5896:Array;
      
      private var _8649:Array;
      
      public function _1110(param1:Object, param2:Object)
      {
         this._8650 = new Dictionary(true);
         this._8645 = new Dictionary(true);
         super();
         if(!helper)
         {
            helper = new BitmapSourceHelper();
         }
         this._8651 = param1;
         this._8647 = param2;
      }
      
      public function get bitmapData() : BitmapData
      {
         var _loc1_:BitmapData = null;
         if(this._bitmapData)
         {
            _loc1_ = this._bitmapData;
            this._bitmapData = null;
            return _loc1_;
         }
         return this.getBitmapData(this._8650);
      }
      
      private function getBitmapData(param1:Dictionary) : BitmapData
      {
         var _loc2_:* = undefined;
         var _loc3_:int = 0;
         var _loc4_:* = param1;
         for(_loc2_ in _loc4_)
         {
            return _loc2_;
         }
         return null;
      }
      
      public function get _8585() : BitmapData
      {
         var _loc1_:BitmapData = null;
         if(this._8646)
         {
            _loc1_ = this._8646;
            this._8646 = null;
            return _loc1_;
         }
         return this.getBitmapData(this._8645);
      }
      
      public function _8591(param1:_1113) : void
      {
         var _loc2_:Object = null;
         if(param1.contentsScaleFactor == 1)
         {
            _loc2_ = this._8651 || this._8647;
         }
         else
         {
            _loc2_ = this._8647 || this._8651;
         }
         if(!_loc2_)
         {
            return;
         }
         if(_loc2_ === this._8647)
         {
            if(this.getBitmapData(this._8645))
            {
               param1.invalidateSize();
               param1.invalidateDisplayList();
            }
            else if(this._8649)
            {
               if(this._8649.indexOf(param1))
               {
                  this._8649.push(param1);
               }
            }
            else
            {
               this._8649 = [param1];
               helper.decodeBiampData(this._8647,this._8644);
            }
         }
         else if(this.getBitmapData(this._8650))
         {
            param1.invalidateSize();
            param1.invalidateDisplayList();
         }
         else if(this._5896)
         {
            if(this._5896.indexOf(param1) == -1)
            {
               this._5896.push(param1);
            }
         }
         else
         {
            this._5896 = [param1];
            helper.decodeBiampData(this._8651,this._8648);
         }
      }
      
      private function _8648(param1:BitmapData) : void
      {
         var _loc2_:_1140 = null;
         if(param1)
         {
            this._8650[param1] = true;
            this._bitmapData = param1;
            for each(_loc2_ in this._5896)
            {
               _loc2_.invalidateSize();
               _loc2_.invalidateDisplayList();
            }
         }
         this._5896 = null;
      }
      
      private function _8644(param1:BitmapData) : void
      {
         var _loc2_:_1140 = null;
         if(param1)
         {
            this._8645[param1] = true;
            this._8646 = param1;
            for each(_loc2_ in this._8649)
            {
               _loc2_.invalidateSize();
               _loc2_.invalidateDisplayList();
            }
         }
         this._8649 = null;
      }
   }
}

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.system.ImageDecodingPolicy;
import flash.system.LoaderContext;
import flash.utils.ByteArray;
import flash.utils.Dictionary;

class BitmapSourceHelper
{
   private var callBackMap:Dictionary;
   
   public function BitmapSourceHelper()
   {
      this.callBackMap = new Dictionary();
      super();
   }
   
   public function openAsByteArray(param1:String) : ByteArray
   {
      var bytes:ByteArray;
      var path:String = param1;
      var file:File = new File(File.applicationDirectory.resolvePath(path).nativePath);
      var fs:FileStream = new FileStream();
      try
      {
         fs.open(file,FileMode.READ);
      }
      catch(e:Error)
      {
         return null;
      }
      fs.position = 0;
      bytes = new ByteArray();
      fs.readBytes(bytes);
      fs.close();
      return bytes;
   }
   
   public function decodeBiampData(param1:Object, param2:Function) : void
   {
      var _loc4_:Loader = null;
      var _loc5_:LoaderContext = null;
      var _loc6_:BitmapData = null;
      var _loc3_:ByteArray = param1 as ByteArray;
      if(_loc3_)
      {
         _loc4_ = new Loader();
         this.callBackMap[_loc4_] = param2;
         (_loc5_ = new LoaderContext()).imageDecodingPolicy = ImageDecodingPolicy.ON_LOAD;
         _loc4_.contentLoaderInfo.addEventListener(Event.COMPLETE,this._8652);
         _loc4_.loadBytes(_loc3_,_loc5_);
      }
      else if(param1 is Class)
      {
         _loc6_ = Bitmap(new param1()).bitmapData;
         param2(_loc6_);
      }
      else
      {
         param2(null);
      }
   }
   
   private function _8652(param1:Event) : void
   {
      var _loc2_:Loader = (param1.target as LoaderInfo).loader;
      _loc2_.contentLoaderInfo.removeEventListener(Event.COMPLETE,this._8652);
      var _loc3_:BitmapData = (_loc2_.content as Bitmap).bitmapData;
      var _loc4_:Function = this.callBackMap[_loc2_];
      delete this.callBackMap[_loc2_];
      _loc4_(_loc3_);
   }
}

