package _1374
{
   import avmplus.getQualifiedClassName;
   import egret.core._1110;
   import egret.core._1114;
   import egret.core._1129;
   import egret.utils.FileUtil;
   import egret.utils._1295;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   
   public class _1398 implements _1114
   {
      private var _8384:_1295;
      
      public function _1398()
      {
         this._8384 = new _1295();
         super();
      }
      
      public function _1579(param1:Object, param2:Function, param3:Object) : void
      {
         var data:Object = null;
         var className:String = null;
         var url:String = null;
         var bytes:ByteArray = null;
         var index:int = 0;
         var retinaUrl:String = null;
         var retinaBytes:ByteArray = null;
         var loader:Loader = null;
         var source:Object = param1;
         var _1580:Function = param2;
         var oldContent:Object = param3;
         var content:Object = source;
         if(source is Class)
         {
            className = getQualifiedClassName(source);
            data = this._8384.get(className) as BitmapData;
            if(data)
            {
               _1580(data,source);
               return;
            }
            content = new source();
         }
         if(content is Bitmap)
         {
            content = Bitmap(content).bitmapData;
            if(className)
            {
               this._8384.set(className,content);
            }
         }
         if(content is _1110 || content is DisplayObject || content is BitmapData || content is _1129)
         {
            _1580(content,source);
         }
         else if(source is String || source is ByteArray)
         {
            if(source is String)
            {
               data = this._8384.get(String(source));
            }
            if(data)
            {
               _1580(data,source);
            }
            else
            {
               url = source as String;
               if(Boolean(url) && (url.charAt(0) == "/" || url.charAt(0) == "\\"))
               {
                  url = url.substring(1);
               }
               bytes = !!url ? FileUtil.openAsByteArray(url) : null;
               if(Boolean(bytes) && !this._14012(url,bytes))
               {
                  index = int(url.lastIndexOf("."));
                  retinaUrl = url.substring(0,index) + "_r" + url.substring(index);
                  retinaBytes = FileUtil.openAsByteArray(retinaUrl);
                  data = new _1110(bytes,retinaBytes);
                  this._8384.set(String(source),data);
                  _1580(data,source);
               }
               else
               {
                  loader = new Loader();
                  loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,function(param1:Event):void
                  {
                     _1580(source,source);
                  });
                  loader.contentLoaderInfo.addEventListener(Event.COMPLETE,function(param1:Event):void
                  {
                     var _loc2_:BitmapData = null;
                     if(loader.content is Bitmap)
                     {
                        _loc2_ = (loader.content as Bitmap).bitmapData;
                        if(source is String)
                        {
                           _8384.set(String(source),_loc2_);
                        }
                        _1580(_loc2_,source);
                     }
                     else
                     {
                        _1580(loader.content,source);
                     }
                  });
                  if(source is String)
                  {
                     loader.load(new URLRequest(source as String));
                  }
                  else
                  {
                     loader.loadBytes(source as ByteArray);
                  }
               }
            }
         }
         else
         {
            _1580(content,source);
         }
      }
      
      protected function _14012(param1:String, param2:ByteArray) : Boolean
      {
         if(param2[0] != 67 && param2[0] != 70 && param2[0] != 90)
         {
            return false;
         }
         if(param2[1] != 87)
         {
            return false;
         }
         if(param2[2] != 83)
         {
            return false;
         }
         if(param1.indexOf(".swf") < 0)
         {
            return false;
         }
         return true;
      }
   }
}

