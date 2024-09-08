package _1088
{
   import _1177._1181;
   import _1185._1186;
   import _1193._1192;
   import egret.core._1122;
   import egret.core._1131;
   import egret.core._1133;
   import egret.core._1140;
   import egret.core._1141;
   import egret.core.ns_egret;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   use namespace ns_egret;
   
   public class _1093 extends _1140 implements _1131
   {
      private var _7654:Number = 0;
      
      private var _7649:Number = 0;
      
      private var _8426:Object;
      
      private var _7621:_1192;
      
      private var _8429:Boolean = true;
      
      private var _8428:Number = 1;
      
      private var _8423:Boolean = true;
      
      private var _8425:Boolean = true;
      
      ns_egret var _7576:Boolean = false;
      
      ns_egret var _8422:Boolean = false;
      
      public function _1093()
      {
         super();
      }
      
      public function get contentWidth() : Number
      {
         return this._7654;
      }
      
      private function _7645(param1:Number) : void
      {
         if(param1 == this._7654)
         {
            return;
         }
         var _loc2_:Number = this._7654;
         this._7654 = param1;
         _7626("contentWidth",_loc2_,param1);
      }
      
      public function get contentHeight() : Number
      {
         return this._7649;
      }
      
      private function _7643(param1:Number) : void
      {
         if(param1 == this._7649)
         {
            return;
         }
         var _loc2_:Number = this._7649;
         this._7649 = param1;
         _7626("contentHeight",_loc2_,param1);
      }
      
      public function _7729(param1:Number, param2:Number) : void
      {
         if(param1 == this._7654 && param2 == this._7649)
         {
            return;
         }
         this._7645(param1);
         this._7643(param2);
      }
      
      public function get layout() : _1192
      {
         return this._7621;
      }
      
      public function set layout(param1:_1192) : void
      {
         if(this._7621 == param1)
         {
            return;
         }
         if(this._7621)
         {
            this._7621.target = null;
            this._7621.removeEventListener(_1181.PROPERTY_CHANGE,this._8424);
            this._8426 = {"clipAndEnableScrolling":this._7621.clipAndEnableScrolling};
         }
         this._7621 = param1;
         if(this._7621)
         {
            this._7621.target = this;
            this._7621.addEventListener(_1181.PROPERTY_CHANGE,this._8424);
            if(this._8426)
            {
               if(this._8426.clipAndEnableScrolling !== undefined)
               {
                  param1.clipAndEnableScrolling = this._8426.clipAndEnableScrolling;
               }
               if(this._8426.verticalScrollPosition !== undefined)
               {
                  param1.verticalScrollPosition = this._8426.verticalScrollPosition;
               }
               if(this._8426.horizontalScrollPosition !== undefined)
               {
                  param1.horizontalScrollPosition = this._8426.horizontalScrollPosition;
               }
               this._8426 = null;
            }
         }
         this.invalidateSize();
         this.invalidateDisplayList();
         dispatchEvent(new Event("layoutChanged"));
      }
      
      public function get autoLayout() : Boolean
      {
         return this._8429;
      }
      
      public function set autoLayout(param1:Boolean) : void
      {
         if(this._8429 == param1)
         {
            return;
         }
         this._8429 = param1;
         if(param1)
         {
            this.invalidateSize();
            this.invalidateDisplayList();
            this._8420();
         }
      }
      
      override public function set alpha(param1:Number) : void
      {
         if(enabled)
         {
            super.alpha = param1;
         }
         this._8428 = param1;
      }
      
      override public function set mouseChildren(param1:Boolean) : void
      {
         if(enabled)
         {
            super.mouseChildren = param1;
         }
         this._8423 = param1;
      }
      
      override public function set mouseEnabled(param1:Boolean) : void
      {
         if(enabled)
         {
            super.mouseEnabled = param1;
         }
         this._8425 = param1;
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         var _loc2_:Number = NaN;
         super.enabled = param1;
         super.mouseChildren = param1 ? this._8423 : false;
         super.mouseEnabled = param1 ? this._8425 : false;
         if(param1)
         {
            super.alpha = this._8428;
         }
         else
         {
            _loc2_ = getStyle("disabledAlpha");
            if(!isNaN(_loc2_))
            {
               super.alpha = _loc2_;
            }
         }
      }
      
      private function _8424(param1:Event) : void
      {
         var _loc2_:_1181 = param1 as _1181;
         if(_loc2_)
         {
            switch(_loc2_.property)
            {
               case "verticalScrollPosition":
               case "horizontalScrollPosition":
                  dispatchEvent(param1);
            }
         }
      }
      
      override protected function _2438() : void
      {
         super._2438();
         if(!this._7621)
         {
            this.layout = new _1186();
         }
      }
      
      public function get clipAndEnableScrolling() : Boolean
      {
         if(this._7621)
         {
            return this._7621.clipAndEnableScrolling;
         }
         if(Boolean(this._8426) && this._8426.clipAndEnableScrolling !== undefined)
         {
            return this._8426.clipAndEnableScrolling;
         }
         return false;
      }
      
      public function set clipAndEnableScrolling(param1:Boolean) : void
      {
         if(this._7621)
         {
            this._7621.clipAndEnableScrolling = param1;
         }
         else if(this._8426)
         {
            this._8426.clipAndEnableScrolling = param1;
         }
         else
         {
            this._8426 = {"clipAndEnableScrolling":param1};
         }
         this.invalidateSize();
      }
      
      public function _7624(param1:uint) : Number
      {
         return !!this.layout ? this.layout._7624(param1) : 0;
      }
      
      public function _7625(param1:uint) : Number
      {
         return !!this.layout ? this.layout._7625(param1) : 0;
      }
      
      public function get horizontalScrollPosition() : Number
      {
         if(this._7621)
         {
            return this._7621.horizontalScrollPosition;
         }
         if(Boolean(this._8426) && this._8426.horizontalScrollPosition !== undefined)
         {
            return this._8426.horizontalScrollPosition;
         }
         return 0;
      }
      
      public function set horizontalScrollPosition(param1:Number) : void
      {
         if(this._7621)
         {
            this._7621.horizontalScrollPosition = param1;
         }
         else if(this._8426)
         {
            this._8426.horizontalScrollPosition = param1;
         }
         else
         {
            this._8426 = {"horizontalScrollPosition":param1};
         }
      }
      
      public function get verticalScrollPosition() : Number
      {
         if(this._7621)
         {
            return this._7621.verticalScrollPosition;
         }
         if(Boolean(this._8426) && this._8426.verticalScrollPosition !== undefined)
         {
            return this._8426.verticalScrollPosition;
         }
         return 0;
      }
      
      public function set verticalScrollPosition(param1:Number) : void
      {
         if(this._7621)
         {
            this._7621.verticalScrollPosition = param1;
         }
         else if(this._8426)
         {
            this._8426.verticalScrollPosition = param1;
         }
         else
         {
            this._8426 = {"verticalScrollPosition":param1};
         }
      }
      
      override protected function _7028() : void
      {
         if(!this._7621 || !this.ns_egret::_8422)
         {
            return;
         }
         super._7028();
         this._7621._7028();
         if(!_1141._8325(this))
         {
            if(this.clipAndEnableScrolling)
            {
               _7983 = 0;
               _7980 = 0;
            }
         }
      }
      
      ns_egret function _8025() : void
      {
         super.invalidateDisplayList();
      }
      
      override public function invalidateDisplayList() : void
      {
         super.invalidateDisplayList();
         this.ns_egret::_7576 = true;
      }
      
      override ns_egret function _8344() : void
      {
         if(this.autoLayout)
         {
            this.invalidateSize();
            this.invalidateDisplayList();
         }
      }
      
      ns_egret function _8421() : void
      {
         super.invalidateSize();
      }
      
      override public function invalidateSize() : void
      {
         super.invalidateSize();
         this.ns_egret::_8422 = true;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         if(this.ns_egret::_7576)
         {
            this.ns_egret::_7576 = false;
            if(this.autoLayout && Boolean(this._7621))
            {
               this._7621._5823(param1,param2);
            }
            if(this._7621)
            {
               this._7621._8427(param1,param2);
            }
         }
      }
      
      public function get _2249() : int
      {
         return -1;
      }
      
      public function getElementAt(param1:int) : _1133
      {
         return null;
      }
      
      public function getElementIndex(param1:_1133) : int
      {
         return -1;
      }
      
      public function _8171(param1:_1133) : Boolean
      {
         while(param1)
         {
            if(param1 == this)
            {
               return true;
            }
            if(!(param1.parent is _1133))
            {
               return false;
            }
            param1 = _1133(param1.parent);
         }
         return false;
      }
      
      public function _7581() : Vector.<int>
      {
         var _loc2_:int = 0;
         var _loc3_:_1122 = null;
         var _loc4_:Rectangle = null;
         var _loc1_:Vector.<int> = new Vector.<int>();
         if(!scrollRect)
         {
            _loc2_ = 0;
            while(_loc2_ < numChildren)
            {
               _loc1_.push(_loc2_);
               _loc2_++;
            }
         }
         else
         {
            _loc2_ = 0;
            while(_loc2_ < numChildren)
            {
               _loc3_ = getChildAt(_loc2_) as _1122;
               if(_loc3_)
               {
                  (_loc4_ = new Rectangle()).x = _loc3_.layoutBoundsX;
                  _loc4_.y = _loc3_.layoutBoundsY;
                  _loc4_.width = _loc3_.layoutBoundsWidth;
                  _loc4_.height = _loc3_.layoutBoundsHeight;
                  if(scrollRect.intersects(_loc4_))
                  {
                     _loc1_.push(_loc2_);
                  }
               }
               _loc2_++;
            }
         }
         return _loc1_;
      }
      
      public function _7577(param1:int, param2:int) : void
      {
      }
      
      public function _7596(param1:int) : _1133
      {
         return this.getElementAt(param1);
      }
      
      override public function set scrollRect(param1:Rectangle) : void
      {
         super.scrollRect = param1;
         if(hasEventListener("scrollRectChange"))
         {
            dispatchEvent(new Event("scrollRectChange"));
         }
      }
   }
}

