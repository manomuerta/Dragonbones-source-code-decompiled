package _724
{
   import _35._38;
   import _521._528;
   import _859._860;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   public class _14087 extends _725
   {
      private var _5882:Sprite;
      
      private var _bitmapData:BitmapData;
      
      private var _config:_38;
      
      private var _parent:_14086;
      
      private var _5880:Array;
      
      public function _14087(param1:_14086, param2:_38, param3:String)
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
      
      public function get sprite() : Sprite
      {
         if(this._parent.missing)
         {
            return null;
         }
         if(this._parent._5879 == STATUS_LOADING)
         {
            return null;
         }
         if(this._parent._5879 == STATUS_LIMIT)
         {
            return null;
         }
         this._5882 = this._parent._5878(name);
         if(this._5882 == null)
         {
            return null;
         }
         return this._5882;
      }
      
      override public function _2108(param1:Function) : void
      {
         if(this._parent.missing)
         {
            param1(null);
         }
         else if(this._parent._5879 == STATUS_LOADING)
         {
            this._5880.push(param1);
         }
         else
         {
            if(this._parent._5879 == STATUS_LIMIT)
            {
               param1(null);
            }
            if(this._5882 == null)
            {
               this._5882 = this._parent._5878(name);
            }
            if(this._5882 == null)
            {
               param1(null);
            }
            else
            {
               param1(this._5882);
            }
         }
      }
      
      public function get bitmapData() : BitmapData
      {
         var _loc1_:Sprite = null;
         var _loc2_:Rectangle = null;
         var _loc3_:Matrix = null;
         if(this._bitmapData)
         {
            return this._bitmapData;
         }
         _loc1_ = this.sprite;
         if(_loc1_)
         {
            this._bitmapData = new BitmapData(_loc1_.width,_loc1_.height,true,16777215);
            _loc2_ = _loc1_.getBounds(_loc1_);
            _loc3_ = new Matrix();
            _loc3_.tx = -_loc2_.x;
            _loc3_.ty = -_loc2_.y;
            this._bitmapData.draw(_loc1_,_loc3_,null,null,null,true);
            return this._bitmapData;
         }
         if(this._parent._5879 == STATUS_LOADING)
         {
            return _528._14511;
         }
         if(this._parent._5879 == STATUS_LIMIT)
         {
            return _528._14512;
         }
         return _528._14513;
      }
      
      public function _5881() : void
      {
         this._5876();
         if(reference.length > 0)
         {
            this.loadImage();
            this._5877();
         }
      }
      
      private function loadImage() : void
      {
         if(this._parent)
         {
            this._parent.loadImage();
         }
      }
      
      public function _5877() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc5_:Sprite = null;
         switch(this._parent._5879)
         {
            case STATUS_NEW:
               _loc1_ = true;
               _loc2_ = false;
               break;
            case STATUS_LOADING:
               _loc1_ = true;
               _loc2_ = false;
               break;
            case STATUS_NORMAL:
               _loc1_ = false;
               _loc2_ = false;
               break;
            case STATUS_MISSING:
            case STATUS_LIMIT:
               _loc2_ = true;
               _loc1_ = false;
         }
         var _loc3_:int = 0;
         var _loc4_:int = int(reference.length);
         while(_loc3_ < _loc4_)
         {
            reference[_loc3_]._5747 = _loc2_;
            reference[_loc3_]._5744 = _loc1_;
            _loc5_ = this.sprite;
            if((Boolean(_loc5_)) && Boolean(_loc5_["drawInited"]))
            {
               reference[_loc3_]._5724 = _loc5_;
            }
            else
            {
               reference[_loc3_]._5724 = this.bitmapData;
            }
            _loc3_++;
         }
         _loc4_ = int(this._5880.length);
         if(_loc4_ > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               this._5880[_loc3_](_loc5_);
               _loc3_++;
            }
         }
         this._5880.length = 0;
      }
      
      public function _5876() : void
      {
         if(this._bitmapData)
         {
            this._bitmapData.dispose();
            this._bitmapData = null;
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
            case STATUS_NEW:
               param1._5744 = true;
               param1._5747 = false;
               this.loadImage();
               break;
            case STATUS_LOADING:
               param1._5744 = true;
               param1._5747 = false;
               break;
            case STATUS_NORMAL:
               param1._5744 = false;
               param1._5747 = false;
               break;
            case STATUS_MISSING:
            case STATUS_LIMIT:
               param1._5747 = true;
               param1._5744 = false;
         }
         var _loc2_:Sprite = this.sprite;
         if(Boolean(_loc2_) && Boolean(_loc2_["drawInited"]))
         {
            param1._5724 = _loc2_;
         }
         else
         {
            param1._5724 = this.bitmapData;
         }
         reference.push(param1);
      }
      
      override public function dispose() : void
      {
         this._5876();
         var _loc1_:int = 0;
         var _loc2_:int = int(reference.length);
         while(_loc1_ < _loc2_)
         {
            reference[_loc1_]._5724 = _528.EMPTY_PLACEHOLDER;
            reference[_loc1_]._5747 = true;
            reference[_loc1_]._5744 = false;
            _loc1_++;
         }
         reference.length = 0;
      }
      
      override public function get missing() : Boolean
      {
         return this._parent.missing;
      }
   }
}

