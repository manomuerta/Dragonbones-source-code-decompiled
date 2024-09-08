package _741
{
   import _14159._14158;
   import _14161.ProcessExecutor;
   import _14201._14205;
   import _14229.SVGEvent;
   import _6.Context;
   import flash.events.Event;
   import flash.filesystem.File;
   import flash.filesystem.FileMode;
   import flash.filesystem.FileStream;
   
   public class _14089 extends _744
   {
      private static const MAX_FILE_SIZE:int = 10000000;
      
      public static const FILE_UNSUPPORTED:int = 3;
      
      public static const FILE_OUT_SIZE:int = 2;
      
      public static const FILE_ERROR:int = 1;
      
      public static const FILE_NORMAL:int = 0;
      
      private var _disposed:Boolean;
      
      protected var _width:int;
      
      protected var _height:int;
      
      private var _svg:_14205;
      
      private var _5789:Function;
      
      public function _14089(param1:File, param2:String)
      {
         super(param1,param2);
      }
      
      public function _14695(param1:Function) : void
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
               var _loc2_:String = fs.readMultiByte(fs.bytesAvailable,"shift-jis");
               fs.close();
               fs = null;
               if(_disposed)
               {
                  return;
               }
               _5789 = callback;
               XML.ignoreWhitespace = false;
               var _loc3_:XML = new XML(_loc2_);
               XML.ignoreWhitespace = true;
               _svg = new _14205();
               _svg.addEventListener(SVGEvent.PARSE_COMPLETE,_14740);
               _svg.parse(_loc3_);
            };
            _14158._14646(this._14482);
            ProcessExecutor.instance.initialize(Context.getInstance().stage);
            fs = new FileStream();
            fs.openAsync(_file,FileMode.READ);
            fs.addEventListener(Event.COMPLETE,loadFileCompete);
         }
         catch(e:Error)
         {
            callback(null,FILE_ERROR);
         }
      }
      
      private function _14482(param1:*) : void
      {
         if(this._5789 != null)
         {
            this._5789.call(null,null,FILE_UNSUPPORTED);
         }
      }
      
      private function _14740(param1:SVGEvent) : void
      {
         var e:SVGEvent = param1;
         try
         {
            this._svg.validate();
            this._svg.width += 1;
            this._svg.height += 1;
            this._svg._14651 = this._svg.width;
            this._svg._14650 = this._svg.height;
            this._svg.offsetX = this._svg.transform.pixelBounds.x / this._svg.transform.concatenatedMatrix.a;
            this._svg.offsetY = this._svg.transform.pixelBounds.y / this._svg.transform.concatenatedMatrix.d;
            this._width = this._svg._14651;
            this._height = this._svg._14650;
            _14158._14741();
         }
         catch(e:Error)
         {
            if(_5789 != null)
            {
               _5789.call(null,null,FILE_UNSUPPORTED);
            }
            return;
         }
         if(this._5789 != null)
         {
            this._5789.call(null,this._svg);
            this._5789 = null;
         }
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this._disposed = true;
      }
   }
}

