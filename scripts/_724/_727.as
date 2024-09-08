package _724
{
   import _35._34;
   import _35._36;
   import _35._37;
   import _35._38;
   import _741._743;
   import _741._746;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class _727 extends _729
   {
      protected var _5886:int;
      
      private var _5883:Object;
      
      private var _5884:_37;
      
      private var _bitmapData:BitmapData;
      
      private var _1855:MovieClip;
      
      public function _727(param1:_743)
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
      
      private function get _5890() : _743
      {
         return _5874[0] as _743;
      }
      
      public function get _5879() : int
      {
         return this._5886;
      }
      
      private function init() : void
      {
         var _loc2_:String = null;
         var _loc3_:_726 = null;
         var _loc1_:_36 = _34._1768(this._5890.data);
         this._5883 = _34._1720(_loc1_._1748);
         for(_loc2_ in this._5883)
         {
            if(this._5883[_loc2_] is _38)
            {
               _loc3_ = new _726(this,this._5883[_loc2_] as _38,_loc2_);
               _5887.push(_loc3_);
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
            (_5887[_loc1_] as _726)._5881();
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
            (_5887[_loc1_] as _726)._5877();
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
         var _loc2_:MovieClip = null;
         if(this._1855 != null)
         {
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
         return _loc2_;
      }
      
      protected function onComplete(param1:Event) : void
      {
         param1.target.removeEventListener(Event.COMPLETE,this.onComplete);
         this._1855 = (param1.target.loader as Loader).content as MovieClip;
         this._1855 = this._1855.getChildAt(0) as MovieClip;
         var _loc2_:int = 0;
         var _loc3_:int = int(_5887.length);
         while(_loc2_ < _loc3_)
         {
            (_5887[_loc2_] as _726)._5876();
            _loc2_++;
         }
         this._5886 = STATUS_NORMAL;
         _loc2_ = 0;
         _loc3_ = int(_5887.length);
         while(_loc2_ < _loc3_)
         {
            (_5887[_loc2_] as _726)._5877();
            _loc2_++;
         }
         _loc2_ = 0;
         _loc3_ = int(_5874.length);
         while(_loc2_ < _loc3_)
         {
            _5874[_loc2_].validate = true;
            _loc2_++;
         }
      }
   }
}

