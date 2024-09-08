package _724
{
   import _1374.Alert;
   import _1404._1407;
   import _35._34;
   import _35._36;
   import _35._37;
   import _35._38;
   import _521._528;
   import _555.LibraryPanelController;
   import _741._14090;
   import _741._746;
   import _97._98;
   import egret.utils.tr;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class _14086 extends _729
   {
      public static const DBSWF:String = "dbswf";
      
      public static const SWF:String = "swf";
      
      protected var _5886:int;
      
      private var _5883:Object;
      
      private var _5884:_37;
      
      private var _bitmapData:BitmapData;
      
      private var _1855:MovieClip;
      
      private var _14710:MovieClip;
      
      private var _14713:Array;
      
      private var _14703:_14088;
      
      public function _14086(param1:_14090)
      {
         var _loc2_:Vector.<_746> = null;
         if(param1)
         {
            _loc2_ = new Vector.<_746>();
            _loc2_.push(param1);
         }
         super(_loc2_);
         _name = this._5890.name;
         _path = this._5890.name;
         _5873 = this._5890.path;
         param1.group = _734.GROUP_DBSWF;
         this.init();
      }
      
      private function get _5890() : _14090
      {
         return _5874[0] as _14090;
      }
      
      public function get _5879() : int
      {
         return this._5886;
      }
      
      private function init() : void
      {
         var _loc1_:_36 = null;
         if(this._5890.extension == DBSWF)
         {
            _loc1_ = _34._1768(this._5890.data);
            this._5883 = _34._1720(_loc1_._1748);
            this._14705();
         }
         else if(this._5890.extension == SWF)
         {
            if(this._14712())
            {
               this.loadImage();
            }
            else
            {
               if(this._5890.file.exists)
               {
                  this._5890.file.deleteDirectory(true);
               }
               Alert.show(tr("Import.error.nosupport"));
            }
         }
      }
      
      private function _14712() : Boolean
      {
         var _loc1_:String = _98.getType(this._5890.data);
         if(_loc1_ != _98.SWF)
         {
            return false;
         }
         return true;
      }
      
      private function _14705() : void
      {
         var _loc1_:String = null;
         var _loc2_:_14087 = null;
         for(_loc1_ in this._5883)
         {
            if(this._5883[_loc1_] is _38)
            {
               _loc2_ = new _14087(this,this._5883[_loc1_] as _38,_loc1_);
               _5887.push(_loc2_);
            }
         }
      }
      
      override public function _4188() : Boolean
      {
         var _loc1_:Boolean = false;
         if(_1563 == STATUS_MISSING)
         {
            if(this._5890 && !this._5890.removed && this._5890.group == null)
            {
               _1563 = STATUS_NEW;
               this._5886 = STATUS_NEW;
               this._5881();
            }
         }
         else if(this._5890.removed)
         {
            _1563 = STATUS_MISSING;
            this._5886 = STATUS_MISSING;
            this._5888();
         }
         else if(!this._5890.validate)
         {
            _1563 = STATUS_NEW;
            this._5886 = STATUS_NEW;
            this._5881();
         }
         return false;
      }
      
      private function _5881() : void
      {
         this._5886 = _731.IMAGE_STATUS_NEW;
         var _loc1_:int = 0;
         var _loc2_:int = int(_5887.length);
         while(_loc1_ < _loc2_)
         {
            (_5887[_loc1_] as _14087)._5881();
            _loc1_++;
         }
      }
      
      private function _5888() : void
      {
         this._5886 = STATUS_MISSING;
         var _loc1_:int = 0;
         var _loc2_:int = int(_5887.length);
         while(_loc1_ < _loc2_)
         {
            (_5887[_loc1_] as _14087)._5877();
            _loc1_++;
         }
         _loc1_ = 0;
         _loc2_ = int(_5874.length);
         while(_loc1_ < _loc2_)
         {
            _5874[_loc1_].validate = true;
            _loc1_++;
         }
      }
      
      public function loadImage() : void
      {
         if(this._5886 != STATUS_LOADING && this._5886 != STATUS_NORMAL)
         {
            this._5886 = STATUS_LOADING;
            try
            {
               this._5885();
            }
            catch(e:Error)
            {
               _5886 = STATUS_MISSING;
               dispose();
            }
         }
      }
      
      private function _5885() : void
      {
         var _loc1_:Loader = new Loader();
         _loc1_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onComplete);
         _loc1_.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this.onError);
         _loc1_.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onError);
         var _loc2_:ByteArray = this._5890.data as ByteArray;
         _loc2_.position = 0;
         var _loc3_:LoaderContext = new LoaderContext();
         _loc3_.allowLoadBytesCodeExecution = true;
         _loc1_.loadBytes(_loc2_,_loc3_);
      }
      
      private function _5889(param1:Event) : void
      {
      }
      
      private function onError(param1:IOErrorEvent) : void
      {
         this._5886 = STATUS_MISSING;
         dispose();
      }
      
      private function onInit(param1:Event) : void
      {
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
      }
      
      public function _5878(param1:String) : MovieClip
      {
         if(this._5890.extension == SWF)
         {
            return this._14707(param1);
         }
         return this._14702(param1);
      }
      
      protected function _14707(param1:String) : MovieClip
      {
         var _loc3_:MovieClip = null;
         var _loc4_:Object = null;
         var _loc2_:MovieClip = new MovieClip();
         if(this._1855 != null)
         {
            if(this._14703)
            {
               _loc3_ = this._14703._14709(param1);
               if(_loc3_)
               {
                  _loc2_.drawInited = true;
                  _loc4_ = this._14708(param1);
                  if(_loc4_)
                  {
                     _loc3_.rotation = _loc4_.rotation;
                  }
                  _loc2_.addChild(_loc3_);
                  return _loc2_;
               }
            }
            if(this._1855.numChildren > 0)
            {
               _loc2_ = this._1855.getChildByName(param1) as MovieClip;
               if(_loc2_)
               {
                  _loc2_.x = 0;
                  _loc2_.y = 0;
               }
            }
         }
         else
         {
            _loc2_ = this._14711;
         }
         _loc2_.drawInited = false;
         return _loc2_;
      }
      
      protected function _14702(param1:String) : MovieClip
      {
         var _loc2_:MovieClip = null;
         if(this._1855 != null)
         {
            if(this._14703)
            {
               _loc2_ = this._14703._14704(param1);
               if(_loc2_)
               {
                  _loc2_.drawInited = true;
                  return _loc2_;
               }
            }
            this._1855.gotoAndStop(param1);
            if(this._1855.numChildren > 0)
            {
               _loc2_ = this._1855.getChildAt(0) as MovieClip;
               if(_loc2_)
               {
                  _loc2_.x = 0;
                  _loc2_.y = 0;
                  if(_loc2_.parent)
                  {
                     _loc2_.parent.removeChild(_loc2_);
                  }
               }
            }
         }
         else
         {
            _loc2_ = this._14711;
         }
         _loc2_.drawInited = false;
         return _loc2_;
      }
      
      protected function get _14711() : MovieClip
      {
         if(!this._14710)
         {
            this._14710 = new MovieClip();
            this._14710.addChild(new Bitmap(_528._14513));
         }
         return this._14710;
      }
      
      protected function onComplete(param1:Event) : void
      {
         var e:Event = param1;
         e.target.removeEventListener(Event.COMPLETE,this.onComplete);
         this._1855 = (e.target.loader as Loader).content as MovieClip;
         if(this._5890.extension != SWF)
         {
            this._1855 = this._1855.getChildAt(0) as MovieClip;
         }
         else if(this._1855.totalFrames > 1)
         {
            this._1855.gotoAndStop(0);
         }
         try
         {
            if(!this._14703)
            {
               this._14703 = new _14088();
               this._14703._14701 = this.activate;
               this._14703._14700 = this._14706;
               this._14703.convert(this._5890.data,this._5890.extension);
            }
         }
         catch(e:Error)
         {
            _14703 = null;
         }
      }
      
      private function _14706() : void
      {
         var _loc2_:Object = null;
         var _loc3_:MovieClip = null;
         var _loc4_:int = 0;
         var _loc5_:Rectangle = null;
         var _loc6_:_14087 = null;
         var _loc7_:Number = NaN;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(this._5890.extension == SWF && Boolean(this._14703))
         {
            this._5883 = {};
            this._14713 = [];
            this._5883.__name = this._5890.name;
            for each(_loc2_ in this._14703._1748)
            {
               _loc3_ = this._1855.getChildByName(_loc2_.instanceName) as MovieClip;
               _loc4_ = this._1855.getChildIndex(_loc3_);
               _loc5_ = new Rectangle(0,0,_loc3_.width,_loc3_.height);
               this._5883[_loc2_.instanceName] = new _38(_loc5_,null,false);
               _loc6_ = new _14087(this,this._5883[_loc2_.instanceName],_loc2_.instanceName);
               _5887.push(_loc6_);
               _loc7_ = Math.PI * _loc3_.rotation / 180;
               _loc8_ = _loc3_.x + _loc3_.width / 2;
               _loc9_ = _loc3_.y + _loc3_.height / 2;
               this._14713.push({
                  "index":_loc4_,
                  "name":_loc3_.name,
                  "rotation":_loc3_.rotation,
                  "path":this._5890.name + "@" + _loc3_.name,
                  "point":new Point(_loc8_,_loc9_)
               });
            }
            this._14713.sortOn("index",Array.NUMERIC);
         }
         this.activate();
         var _loc1_:LibraryPanelController = _1407.getInstance(LibraryPanelController) as LibraryPanelController;
         _loc1_._4188();
      }
      
      protected function activate() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(_5887.length);
         while(_loc1_ < _loc2_)
         {
            (_5887[_loc1_] as _14087)._5876();
            _loc1_++;
         }
         this._5886 = STATUS_NORMAL;
         _loc1_ = 0;
         _loc2_ = int(_5887.length);
         while(_loc1_ < _loc2_)
         {
            (_5887[_loc1_] as _14087)._5877();
            _loc1_++;
         }
         _loc1_ = 0;
         _loc2_ = int(_5874.length);
         while(_loc1_ < _loc2_)
         {
            _5874[_loc1_].validate = true;
            _loc1_++;
         }
      }
      
      protected function _14708(param1:String) : Object
      {
         var _loc2_:int = 0;
         while(_loc2_ < this._14713.length)
         {
            if(this._14713[_loc2_].name == param1)
            {
               return this._14713[_loc2_];
            }
            _loc2_++;
         }
         return null;
      }
   }
}

