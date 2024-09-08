package _741
{
   import _521._528;
   import _97._118;
   import flash.events.Event;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   import flash.utils.ByteArray;
   
   public class _747 extends _742
   {
      private static const MAX_FILE_SIZE:int = 10000000;
      
      public static const FILE_OUT_SIZE:int = 2;
      
      public static const FILE_ERROR:int = 1;
      
      public static const FILE_NORMAL:int = 0;
      
      private var _disposed:Boolean;
      
      public function _747(param1:File, param2:String)
      {
         var _loc3_:Array = null;
         super(param1,param2);
         if(param1)
         {
            _loc3_ = _118._2380(param1.nativePath);
            if(Boolean(_loc3_) && _loc3_.length == 2)
            {
               this._width = _loc3_[0];
               this._height = _loc3_[1];
            }
         }
      }
      
      override public function getBitmapData(param1:Function) : void
      {
         var loadFileCompete:Function;
         var fs:FileStream = null;
         var callback:Function = param1;
         if(this._disposed)
         {
            return;
         }
         if(_file.size > MAX_FILE_SIZE)
         {
            callback(null,FILE_OUT_SIZE);
            return;
         }
         try
         {
            loadFileCompete = function(param1:Event):void
            {
               var _loc2_:ByteArray = new ByteArray();
               fs.readBytes(_loc2_);
               fs.close();
               if(_disposed)
               {
                  return;
               }
               _528._3818.decode(_loc2_,callback);
            };
            fs = new FileStream();
            fs.openAsync(_file,FileMode.READ);
            fs.addEventListener(Event.COMPLETE,loadFileCompete);
         }
         catch(e:Error)
         {
            callback(null,FILE_ERROR);
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this._disposed = true;
      }
   }
}

