package _724
{
   import _35._34;
   import _35._37;
   import _35._38;
   import _741._744;
   import _741._746;
   import _741._749;
   import flash.display.BitmapData;
   
   public class _738 extends _729
   {
      protected var _5886:int;
      
      private var _5883:Object;
      
      private var _5884:_37;
      
      private var _bitmapData:BitmapData;
      
      public function _738(param1:Vector.<_746>)
      {
         super(param1);
         _5874[0].group = _734.GROUP_TEXTURE;
         _5874[1].group = _734.GROUP_TEXTURE;
         _name = _5874[0].name;
         _path = _5874[0].name;
         _5873 = _5874[0].path;
         this.init();
      }
      
      private function init() : void
      {
         var _loc3_:String = null;
         var _loc4_:_737 = null;
         var _loc1_:Object = this._5910.data;
         if(_loc1_ == null)
         {
            return;
         }
         this._5883 = _34._1720(_loc1_);
         this._5910.validate = true;
         var _loc2_:Object = this._5883;
         for(_loc3_ in _loc2_)
         {
            if(_loc2_[_loc3_] is _38)
            {
               _loc4_ = new _737(this,_loc2_[_loc3_] as _38,_loc3_);
               _5887.push(_loc4_);
            }
         }
      }
      
      override public function _4188() : Boolean
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         if(_1563 == STATUS_MISSING)
         {
            _loc3_ = 0;
            _loc4_ = int(_5874.length);
            while(_loc3_ < _loc4_)
            {
               if(_5874[_loc3_].removed)
               {
                  _loc2_ = true;
                  break;
               }
               _loc3_++;
            }
            if(!_loc2_)
            {
               _loc1_ = true;
               _loc3_ = 0;
               _loc4_ = int(_5874.length);
               while(_loc3_ < _loc4_)
               {
                  _5874[_loc3_].group = _734.GROUP_TEXTURE;
                  _loc3_++;
               }
               _1563 = STATUS_NEW;
               this._5881();
            }
         }
         else
         {
            _loc2_ = false;
            _loc3_ = 0;
            _loc4_ = int(_5874.length);
            while(_loc3_ < _loc4_)
            {
               if(_5874[_loc3_].removed)
               {
                  _loc2_ = true;
                  break;
               }
               if(!_5874[_loc3_].validate)
               {
                  _loc5_ = true;
               }
               _loc3_++;
            }
            if(_loc2_)
            {
               _loc1_ = true;
               _loc3_ = 0;
               _loc4_ = int(_5874.length);
               while(_loc3_ < _loc4_)
               {
                  _5874[_loc3_].group = null;
                  _loc3_++;
               }
               _1563 = STATUS_MISSING;
               this._5888();
            }
            else if(_loc5_)
            {
               _loc1_ = true;
               _1563 = STATUS_NEW;
               if(!this._5910.validate)
               {
                  this._5911();
               }
               this._5881();
            }
         }
         return _loc1_;
      }
      
      private function get _5910() : _744
      {
         return _5874[0] as _744;
      }
      
      private function get _5897() : _749
      {
         return _5874[1] as _749;
      }
      
      public function get _5879() : int
      {
         return this._5886;
      }
      
      public function loadImage() : void
      {
         if(this._5886 != _731.IMAGE_STATUS_LOADING && this._5886 != _731.IMAGE_STATUS_NORMAL)
         {
            this._5886 = _731.IMAGE_STATUS_LOADING;
            try
            {
               this._5885();
            }
            catch(e:Error)
            {
               _5886 = _731.IMAGE_STATUS_MISSING;
               dispose();
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
         var _loc2_:int = 0;
         var _loc3_:int = int(_5887.length);
         while(_loc2_ < _loc3_)
         {
            (_5887[_loc2_] as _737)._5876();
            _loc2_++;
         }
         this._5886 = _731.IMAGE_STATUS_NORMAL;
         this._bitmapData = param1;
         this._5909();
         _loc2_ = 0;
         _loc3_ = int(_5887.length);
         while(_loc2_ < _loc3_)
         {
            (_5887[_loc2_] as _737)._5877();
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
      
      protected function _5898() : void
      {
         this._5886 = _731.IMAGE_STATUS_LIMIT;
         if(this._5884)
         {
            this._5884.dispose();
            this._5884 = null;
         }
         var _loc1_:int = 0;
         var _loc2_:int = int(_5887.length);
         while(_loc1_ < _loc2_)
         {
            (_5887[_loc1_] as _737)._5877();
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
      
      private function _5888() : void
      {
         this._5886 = _731.IMAGE_STATUS_MISSING;
         if(this._5884)
         {
            this._5884.dispose();
            this._5884 = null;
         }
         var _loc1_:int = 0;
         var _loc2_:int = int(_5887.length);
         while(_loc1_ < _loc2_)
         {
            (_5887[_loc1_] as _737)._5877();
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
      
      private function _5911() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = int(_5887.length);
         while(_loc1_ < _loc2_)
         {
            (_5887[_loc1_] as _737).dispose();
            _loc1_++;
         }
         this.init();
      }
      
      private function _5881() : void
      {
         this._5886 = _731.IMAGE_STATUS_NEW;
         if(this._5884)
         {
            this._5884.dispose();
            this._5884 = null;
         }
         var _loc1_:int = 0;
         var _loc2_:int = int(_5887.length);
         while(_loc1_ < _loc2_)
         {
            (_5887[_loc1_] as _737)._5881();
            _loc1_++;
         }
      }
      
      private function _5909() : void
      {
         if(this._5884)
         {
            this._5884.dispose();
            this._5884 = null;
         }
         if(this._5884 == null && this._bitmapData != null && this._5910 != null)
         {
            this._5884 = new _37(this._bitmapData,this._5910.data);
         }
      }
      
      public function _5907(param1:String) : BitmapData
      {
         if(this._5884)
         {
            return this._5884.getBitmapData(param1);
         }
         return null;
      }
      
      override public function dispose() : void
      {
         this._5886 = _731.IMAGE_STATUS_MISSING;
         var _loc1_:int = 0;
         var _loc2_:int = int(_5887.length);
         while(_loc1_ < _loc2_)
         {
            (_5887[_loc1_] as _737).dispose();
            _loc1_++;
         }
         if(this._5884)
         {
            this._5884.dispose();
            this._5884 = null;
         }
      }
      
      public function _10583(param1:String) : Boolean
      {
         if(this._5884)
         {
            return this._5884.getRegion(param1) != null;
         }
         return false;
      }
   }
}

