package _724
{
   import _35._38;
   import _521._528;
   import _859._860;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   
   public class _737 extends _732
   {
      private var _parent:_738;
      
      private var _config:_38;
      
      private var _5880:Array;
      
      private var _5908:Boolean;
      
      public function _737(param1:_738, param2:_38, param3:String)
      {
         this._5880 = [];
         super();
         this._parent = param1;
         this._config = param2;
         _name = param3;
         _path = param1.name + "@" + _name;
         _5873 = param1._2682 + "@" + _name;
         if(this._config.frame)
         {
            width = this._config.frame.width;
            height = this._config.frame.height;
         }
         else
         {
            width = this._config.region.width;
            height = this._config.region.height;
         }
         _2166 = -width / 2;
         _2167 = -height / 2;
      }
      
      public function get textureName() : String
      {
         return this._parent.name;
      }
      
      public function _5881() : void
      {
         if(_bitmapData)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
         if(reference.length > 0)
         {
            this.loadImage();
         }
      }
      
      public function _5877() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         switch(this._parent._5879)
         {
            case _731.IMAGE_STATUS_NEW:
               _loc1_ = true;
               _loc2_ = false;
               break;
            case _731.IMAGE_STATUS_LOADING:
               _loc1_ = true;
               _loc2_ = false;
               break;
            case _731.IMAGE_STATUS_NORMAL:
               _loc1_ = false;
               _loc2_ = false;
               break;
            case _731.IMAGE_STATUS_MISSING:
            case _731.IMAGE_STATUS_LIMIT:
               _loc2_ = true;
               _loc1_ = false;
         }
         var _loc3_:BitmapData = this.bitmapData;
         var _loc4_:int = 0;
         var _loc5_:int = int(reference.length);
         while(_loc4_ < _loc5_)
         {
            reference[_loc4_]._5747 = _loc2_;
            reference[_loc4_]._5744 = _loc1_;
            reference[_loc4_]._5724 = _loc3_;
            _loc4_++;
         }
         _loc5_ = int(this._5880.length);
         if(_loc5_ > 0)
         {
            _loc4_ = 0;
            while(_loc4_ < _loc5_)
            {
               this._5880[_loc4_](_bitmapData);
               _loc4_++;
            }
         }
         this._5880.length = 0;
      }
      
      public function _5876() : void
      {
         if(_bitmapData)
         {
            _bitmapData.dispose();
            _bitmapData = null;
         }
      }
      
      override public function get bitmapData() : BitmapData
      {
         if(this._parent.missing)
         {
            return _528._14513;
         }
         if(this._parent._5879 == _731.IMAGE_STATUS_LOADING)
         {
            return _528._14511;
         }
         if(this._parent._5879 == _731.IMAGE_STATUS_LIMIT)
         {
            return _528._14512;
         }
         if(_bitmapData == null)
         {
            _bitmapData = this._parent._5907(name);
         }
         if(_bitmapData == null)
         {
            this._5908 = true;
            return _528.EMPTY_PLACEHOLDER;
         }
         return _bitmapData;
      }
      
      override public function _2095(param1:Function) : void
      {
         switch(this._parent._5879)
         {
            case _731.IMAGE_STATUS_NEW:
               this.loadImage();
               if(param1 != null)
               {
                  this._5880.push(param1);
               }
               break;
            case _731.IMAGE_STATUS_LOADING:
               if(param1 != null)
               {
                  this._5880.push(param1);
               }
               break;
            case _731.IMAGE_STATUS_NORMAL:
               if(param1 != null)
               {
                  param1(this.bitmapData);
               }
               break;
            case _731.IMAGE_STATUS_LIMIT:
            case _731.IMAGE_STATUS_MISSING:
               if(param1 != null)
               {
                  param1(_528._14513);
               }
         }
      }
      
      override public function _2108(param1:Function) : void
      {
         this._2095(param1);
      }
      
      public function loadImage() : void
      {
         if(this._parent)
         {
            this._parent.loadImage();
         }
      }
      
      override public function _5735(param1:_860) : void
      {
         if(reference.indexOf(param1) >= 0)
         {
            return;
         }
         switch(this._parent._5879)
         {
            case _731.IMAGE_STATUS_NEW:
               param1._5744 = true;
               param1._5747 = false;
               this.loadImage();
               break;
            case _731.IMAGE_STATUS_LOADING:
               param1._5744 = true;
               param1._5747 = false;
               break;
            case _731.IMAGE_STATUS_NORMAL:
               param1._5744 = false;
               param1._5747 = false;
               break;
            case _731.IMAGE_STATUS_MISSING:
            case _731.IMAGE_STATUS_LIMIT:
               param1._5747 = true;
               param1._5744 = false;
         }
         if(this._parent._5879 != _731.IMAGE_STATUS_LOADING)
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
      
      override public function dispose() : void
      {
         this._8381();
         this._5876();
         var _loc1_:int = 0;
         var _loc2_:int = int(reference.length);
         while(_loc1_ < _loc2_)
         {
            reference[_loc1_]._5747 = true;
            reference[_loc1_]._5744 = false;
            reference[_loc1_]._5724 = _528.EMPTY_PLACEHOLDER;
            _loc1_++;
         }
         reference.length = 0;
         this._5908 = true;
      }
      
      override public function get missing() : Boolean
      {
         return this._parent.missing || this._5908;
      }
      
      public function get parent() : _738
      {
         return this._parent;
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
         if(this._parent._5879 == _731.IMAGE_STATUS_LOADING)
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
      
      override public function _10584() : Vector.<String>
      {
         if(this._parent)
         {
            return this._parent._10584();
         }
         return new Vector.<String>();
      }
   }
}

