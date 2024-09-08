package _724
{
   import _521._528;
   import _741._742;
   import _741._746;
   import _741._749;
   import _859._860;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   
   public class _731 extends _732
   {
      public static const IMAGE_STATUS_NEW:int = 0;
      
      public static const IMAGE_STATUS_LOADING:int = 1;
      
      public static const IMAGE_STATUS_NORMAL:int = 2;
      
      public static const IMAGE_STATUS_MISSING:int = 3;
      
      public static const IMAGE_STATUS_LIMIT:int = 4;
      
      protected var _5886:int;
      
      protected var _5880:Array;
      
      public function _731(param1:_746)
      {
         this._5880 = [];
         super(param1);
         this._5897.group = _734.GROUP_IMAGE;
         _name = this._5897.name;
         _path = this._5897.name;
         _5873 = this._5897.path;
         width = 0;
         height = 0;
         _2166 = 0;
         _2167 = 0;
         if(param1 is _742)
         {
            width = (param1 as _742).width;
            height = (param1 as _742).height;
         }
      }
      
      private function get _5897() : _742
      {
         return _5874[0] as _742;
      }
      
      override public function _4188() : Boolean
      {
         var _loc1_:Boolean = false;
         if(_1563 == STATUS_MISSING)
         {
            if(this._5897 && !this._5897.removed && this._5897.group == null)
            {
               _1563 = STATUS_NEW;
               this._5886 = IMAGE_STATUS_NEW;
               if(reference.length > 0)
               {
                  this.loadImage();
               }
            }
         }
         else if(this._5897.removed || this._5897.group == _734.GROUP_TEXTURE)
         {
            _1563 = STATUS_MISSING;
            this._5886 = IMAGE_STATUS_MISSING;
            this._5888();
         }
         else if(!this._5897.validate)
         {
            _1563 = STATUS_NEW;
            this._5886 = IMAGE_STATUS_NEW;
            if(reference.length > 0)
            {
               this.loadImage();
            }
         }
         return false;
      }
      
      public function loadImage() : void
      {
         if(this._5886 != IMAGE_STATUS_LOADING && this._5886 != IMAGE_STATUS_NORMAL)
         {
            this._5886 = IMAGE_STATUS_LOADING;
            try
            {
               this._5885();
            }
            catch(e:Error)
            {
               _5886 = IMAGE_STATUS_MISSING;
               _5888();
            }
         }
      }
      
      private function _5885() : void
      {
         var onBmpDLoad:Function = null;
         onBmpDLoad = function(param1:BitmapData, param2:int = 0):void
         {
            switch(param2)
            {
               case _749.FILE_ERROR:
                  _5888();
                  break;
               case _749.FILE_OUT_SIZE:
                  _5898();
                  break;
               case _749.FILE_NORMAL:
                  onComplete(param1);
            }
         };
         this._5897.getBitmapData(onBmpDLoad);
      }
      
      protected function onComplete(param1:BitmapData) : void
      {
         if(_bitmapData)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
         _bitmapData = param1;
         this._5886 = IMAGE_STATUS_NORMAL;
         this._5897.validate = true;
         var _loc2_:int = 0;
         var _loc3_:int = int(reference.length);
         while(_loc2_ < _loc3_)
         {
            reference[_loc2_]._5744 = false;
            reference[_loc2_]._5747 = false;
            reference[_loc2_]._5724 = _bitmapData;
            _loc2_++;
         }
         width = _bitmapData.width;
         height = _bitmapData.height;
         _2166 = -_bitmapData.width / 2;
         _2167 = -_bitmapData.height / 2;
         _loc3_ = int(this._5880.length);
         if(_loc3_ > 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this._5880[_loc2_](_bitmapData);
               _loc2_++;
            }
         }
         this._5880.length = 0;
      }
      
      protected function _5898() : void
      {
         _disposed = true;
         if(_bitmapData)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
         this._5886 = IMAGE_STATUS_LIMIT;
         this._5897.validate = true;
         var _loc1_:int = 0;
         var _loc2_:int = int(reference.length);
         while(_loc1_ < _loc2_)
         {
            reference[_loc1_]._5744 = false;
            reference[_loc1_]._5747 = false;
            reference[_loc1_]._5724 = _528._14512;
            _loc1_++;
         }
         _loc2_ = int(this._5880.length);
         if(_loc2_ > 0)
         {
            _loc1_ = 0;
            while(_loc1_ < _loc2_)
            {
               this._5880[_loc1_](_528._14513);
               _loc1_++;
            }
         }
         this._5880.length = 0;
      }
      
      private function _5888() : void
      {
         _disposed = true;
         if(_bitmapData)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
         this._5886 = IMAGE_STATUS_MISSING;
         this._5897.validate = true;
         var _loc1_:int = 0;
         var _loc2_:int = int(reference.length);
         while(_loc1_ < _loc2_)
         {
            reference[_loc1_]._5747 = true;
            reference[_loc1_]._5744 = false;
            reference[_loc1_]._5724 = _528._14513;
            _loc1_++;
         }
         _loc2_ = int(this._5880.length);
         if(_loc2_ > 0)
         {
            _loc1_ = 0;
            while(_loc1_ < _loc2_)
            {
               this._5880[_loc1_](_528._14513);
               _loc1_++;
            }
         }
         this._5880.length = 0;
      }
      
      override public function _5735(param1:_860) : void
      {
         if(reference.indexOf(param1) >= 0)
         {
            return;
         }
         this.loadImage();
         switch(this._5886)
         {
            case IMAGE_STATUS_NEW:
               param1._5744 = true;
               param1._5747 = false;
               break;
            case IMAGE_STATUS_LOADING:
               param1._5744 = true;
               param1._5747 = false;
               break;
            case IMAGE_STATUS_NORMAL:
               param1._5744 = false;
               param1._5747 = false;
               break;
            case IMAGE_STATUS_MISSING:
            case IMAGE_STATUS_LIMIT:
               param1._5747 = true;
               param1._5744 = false;
         }
         if(this._5886 != IMAGE_STATUS_LOADING)
         {
            param1._5724 = this.bitmapData;
         }
         else
         {
            param1._5724 = _528.EMPTY_PLACEHOLDER;
            this.startTimer();
         }
         reference.push(param1);
      }
      
      override public function get bitmapData() : BitmapData
      {
         switch(this._5886)
         {
            case IMAGE_STATUS_NEW:
               this.loadImage();
               return _528._14511;
            case IMAGE_STATUS_LIMIT:
               return _528._14512;
            case IMAGE_STATUS_LOADING:
               return _528._14511;
            case IMAGE_STATUS_NORMAL:
               return _bitmapData;
            case IMAGE_STATUS_MISSING:
               return _528._14513;
            default:
               return _bitmapData;
         }
      }
      
      override public function _2095(param1:Function) : void
      {
         switch(this._5886)
         {
            case IMAGE_STATUS_NEW:
               this.loadImage();
               this._5880.push(param1);
               break;
            case IMAGE_STATUS_LOADING:
               this._5880.push(param1);
               break;
            case IMAGE_STATUS_NORMAL:
               param1(_bitmapData);
               break;
            case IMAGE_STATUS_MISSING:
            case IMAGE_STATUS_LIMIT:
               param1(_528._14513);
         }
      }
      
      override public function _2108(param1:Function) : void
      {
         this._2095(param1);
      }
      
      override public function dispose() : void
      {
         this._8381();
         _disposed = true;
         if(_bitmapData)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
         this._5886 = IMAGE_STATUS_MISSING;
         this._5897.dispose();
         this._5897.validate = true;
      }
      
      override public function get missing() : Boolean
      {
         return _1563 == STATUS_MISSING || this._5897.group != _734.GROUP_IMAGE;
      }
      
      private function startTimer() : void
      {
         if(_10536.running)
         {
            return;
         }
         _10536.addEventListener(TimerEvent.TIMER_COMPLETE,this._5388);
         _10536.start();
      }
      
      private function _5388(param1:TimerEvent) : void
      {
         if(!_disposed && this._5886 == _731.IMAGE_STATUS_LOADING)
         {
            this._10535();
         }
         this._8381();
      }
      
      private function _8381() : void
      {
         _10536.removeEventListener(TimerEvent.TIMER_COMPLETE,this._5388);
         _10536.reset();
      }
      
      private function _10535() : void
      {
         var _loc1_:BitmapData = this.bitmapData;
         var _loc2_:int = 0;
         var _loc3_:int = int(reference.length);
         while(_loc2_ < _loc3_)
         {
            reference[_loc2_]._5724 = _loc1_;
            _loc2_++;
         }
      }
   }
}

