package _13555
{
   import _1045.Button;
   import _1045.Group;
   import _1045._1085;
   import _1088._1093;
   import _1148.Animation;
   import _1148._1150;
   import _1148._1152;
   import _1155._1158;
   import _1155._1159;
   import _1177.ResizeEvent;
   import _1177._1181;
   import _1185._1189;
   import _1185._1194;
   import _1185._1195;
   import _1193._1192;
   import egret.core._1131;
   import egret.core._1133;
   import egret.core._1134;
   import egret.core._1137;
   import egret.utils._99;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class _13560 extends _1085 implements _1134
   {
      private static var _8194:_1158 = new _1159(0);
      
      private static const NO_PROPOSED_PAGE:int = -2;
      
      public var _8180:Button;
      
      public var _8179:Button;
      
      public var _2440:Group;
      
      private var _8182:Number = 500;
      
      private var _8193:Animation = null;
      
      private var _8164:Number;
      
      public var _6146:Function;
      
      private var _8159:int = -2;
      
      private var _8183:int = 0;
      
      private var _8186:int = 0;
      
      private var _8195:_1131;
      
      private var _8151:Boolean = true;
      
      private var _8161:Boolean = false;
      
      private var _8153:Boolean = false;
      
      private var _8156:Boolean = false;
      
      private var _8168:Array;
      
      private var _8167:Boolean = false;
      
      private var _13974:int = 0;
      
      public function _13560()
      {
         this._8168 = [0];
         super();
         _2576 = true;
      }
      
      public function get _8185() : Number
      {
         return this._8182;
      }
      
      public function set _8185(param1:Number) : void
      {
         this._8182 = param1;
      }
      
      private function get _8196() : Animation
      {
         if(this._8193)
         {
            return this._8193;
         }
         this._8193 = new Animation(this._8155);
         this._8193.endFunction = this._8158;
         this._8196._3772 = _8194;
         return this._8193;
      }
      
      private function _8155(param1:Animation) : void
      {
         if(!this._8195)
         {
            return;
         }
         var _loc2_:Number = Number(param1._2584["scrollPosition"]);
         if(this._8151)
         {
            this._8195.verticalScrollPosition = _loc2_;
         }
         else
         {
            this._8195.horizontalScrollPosition = _loc2_;
         }
      }
      
      private function _8158(param1:Animation) : void
      {
         if(!this._8195)
         {
            return;
         }
         if(this._8151)
         {
            if(this._8164 > this._8195.contentHeight - this._8195.height)
            {
               this._8164 = this._8195.contentHeight - this._8195.height;
            }
            this._8195.verticalScrollPosition = this._8164;
         }
         else
         {
            if(this._8164 > this._8195.contentWidth - this._8195.width)
            {
               this._8164 = this._8195.contentWidth - this._8195.width;
            }
            this._8195.horizontalScrollPosition = this._8164;
         }
      }
      
      private function _8181(param1:Number, param2:Number) : void
      {
         if(this._8196.isPlaying)
         {
            this._8158(this._8196);
            this._8196.stop();
         }
         var _loc3_:Number = Math.max(1,this._8195.width);
         var _loc4_:Number = Math.abs(param2 - param1) / _loc3_ * this._8182;
         this._8196.duration = int(Math.min(this._8182,_loc4_));
         this._8196.motionPaths = new <_1150>[new _1152("scrollPosition",param1,param2)];
         this._8196.play();
      }
      
      protected function _8188(param1:int, param2:int) : String
      {
         if(this._6146 != null)
         {
            return this._6146(param1,param2);
         }
         return param1 + 1 + "/" + param2;
      }
      
      public function get _8187() : int
      {
         return this._8159 == NO_PROPOSED_PAGE ? this._8183 : this._8159;
      }
      
      public function set _8187(param1:int) : void
      {
         this._8197(param1);
      }
      
      public function get _8191() : int
      {
         return this._8186;
      }
      
      public function get viewport() : _1131
      {
         return this._8195;
      }
      
      public function set viewport(param1:_1131) : void
      {
         if(param1 == this._8195)
         {
            return;
         }
         this._8163();
         this._8195 = param1;
         this._8170();
         dispatchEvent(new Event("viewportChanged"));
      }
      
      private function _8170() : void
      {
         var _loc1_:_1192 = null;
         if(Boolean(this._2440) && Boolean(this._8195))
         {
            this._8195.clipAndEnableScrolling = true;
            this._8195.left = this._8195.right = this._8195.top = this._8195.bottom = 0;
            this._2440.addElementAt(this._8195,0);
            this._8195.addEventListener(_1181.PROPERTY_CHANGE,this._8150);
            this._8195.addEventListener(ResizeEvent.UI_RESIZE,this._8162);
            this._8151 = this._8173();
            if(this._8195 is _1093)
            {
               this._8195.addEventListener("layoutChanged",this._8175);
               _loc1_ = (this._8195 as _1093).layout;
               if(_loc1_)
               {
                  _loc1_.addEventListener("orientationChanged",this._8175,false,0,true);
               }
            }
            this._8165();
         }
      }
      
      private function _8162(param1:ResizeEvent) : void
      {
         this._8161 = true;
         _2466();
      }
      
      private function _8163() : void
      {
         var _loc1_:_1192 = null;
         if(Boolean(skin) && Boolean(this._8195))
         {
            this._8195.clipAndEnableScrolling = false;
            this._8195.left = this._8195.right = this._8195.top = this._8195.bottom = NaN;
            this._2440.removeElement(this._8195);
            this._8195.removeEventListener(_1181.PROPERTY_CHANGE,this._8150);
            this._8195.removeEventListener(MouseEvent.MOUSE_WHEEL,this._8152);
            this._8195.removeEventListener(ResizeEvent.UI_RESIZE,this._8162);
            if(this._8195 is _1093)
            {
               this._8195.removeEventListener("layoutChanged",this._8175);
               _loc1_ = (this._8195 as _1093).layout;
               if(_loc1_)
               {
                  _loc1_.removeEventListener("orientationChanged",this._8175);
               }
            }
         }
      }
      
      private function _8175(param1:Event = null) : void
      {
         var _loc3_:_1192 = null;
         var _loc2_:Boolean = this._8151;
         this._8151 = this._8173();
         if(this._8151 != _loc2_)
         {
            this._8165();
         }
         if(param1.type == "layoutChanged" && this._8195 is _1093)
         {
            _loc3_ = (this._8195 as _1093).layout;
            if(Boolean(_loc3_) && !_loc3_.hasEventListener("orientationChanged"))
            {
               _loc3_.addEventListener("orientationChanged",this._8175,false,0,true);
            }
         }
      }
      
      private function _8173() : Boolean
      {
         if(!(this._8195 is _1093))
         {
            return true;
         }
         var _loc1_:_1192 = (this._8195 as _1093).layout;
         var _loc2_:Boolean = true;
         if(_loc1_ is _1189)
         {
            _loc2_ = false;
         }
         else if(_loc1_ is _1194 && (_loc1_ as _1194).orientation == _1195.COLUMNS)
         {
            _loc2_ = false;
         }
         else
         {
            _loc2_ = true;
         }
         return _loc2_;
      }
      
      private function _8150(param1:_1181) : void
      {
         switch(param1.property)
         {
            case "contentWidth":
            case "contentHeight":
               this._8161 = true;
               _2466();
               break;
            case "horizontalScrollPosition":
            case "verticalScrollPosition":
               if(this._8153 || this._8193 && this._8193.isPlaying)
               {
                  break;
               }
               this._8161 = true;
               _2466();
               break;
         }
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._8161)
         {
            this._8165();
         }
      }
      
      public function get _8157() : Boolean
      {
         return this._8156;
      }
      
      public function set _8157(param1:Boolean) : void
      {
         if(this._8156 == param1)
         {
            return;
         }
         this._8156 = param1;
         this._8160();
      }
      
      private function _8165() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         this._8161 = false;
         if(!this._8195)
         {
            return;
         }
         this._8153 = true;
         this._8168 = [0];
         this._8186 = 1;
         var _loc3_:Boolean = false;
         if(this._8151)
         {
            _loc1_ = this._8195.verticalScrollPosition;
            this._8195.verticalScrollPosition = 0;
            _loc2_ = this._8195.contentHeight - Math.max(0,this._8195.height);
            _loc2_ = Math.min(this._8195.contentHeight,_loc2_);
            while(this._8195.verticalScrollPosition < _loc2_)
            {
               this._8195.verticalScrollPosition += this._8195._7625(_1137.PAGE_DOWN);
               if(!_loc3_ && this._8195.verticalScrollPosition > _loc1_)
               {
                  _loc3_ = true;
               }
               this._8168[this._8186] = this._8195.verticalScrollPosition;
               ++this._8186;
            }
            _loc4_ = isNaN(this._8195.height) ? 0 : Number(this._8195.height);
            this._8195.verticalScrollPosition = Math.max(0,Math.min(_loc1_,this._8195.contentHeight - _loc4_));
         }
         else
         {
            _loc1_ = this._8195.horizontalScrollPosition;
            this._8195.horizontalScrollPosition = 0;
            _loc2_ = this._8195.contentWidth - Math.max(0,this._8195.width);
            _loc2_ = Math.min(this._8195.contentWidth,_loc2_);
            while(this._8195.horizontalScrollPosition < _loc2_)
            {
               if(this._13971 == 0)
               {
                  this._8195.horizontalScrollPosition += this._8195._7624(_1137.PAGE_RIGHT);
               }
               else
               {
                  this._8195.horizontalScrollPosition += this._13971;
               }
               if(!_loc3_ && this._8195.horizontalScrollPosition > _loc1_)
               {
                  _loc3_ = true;
               }
               this._8168[this._8186] = this._8195.horizontalScrollPosition;
               ++this._8186;
            }
            _loc5_ = isNaN(this._8195.width) ? 0 : Number(this._8195.width);
            this._8195.horizontalScrollPosition = Math.max(0,Math.min(_loc1_,this._8195.contentWidth - _loc5_));
         }
         if(Boolean(this._8193) && this._8193.isPlaying)
         {
            this._8159 = this._8183;
            this._8184();
         }
         else
         {
            if(this._8183 > this._8186 - 1)
            {
               this._8183 = this._8186 - 1;
            }
            this._8160();
            if(this._8151)
            {
               this._8195.verticalScrollPosition = this._8168[this._8183];
            }
            else
            {
               this._8195.horizontalScrollPosition = this._8168[this._8183];
            }
         }
         this._8153 = false;
      }
      
      protected function _8197(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         this._8159 = param1;
         if(this._8167)
         {
            return;
         }
         this._8167 = true;
         _99(this._8184);
         this.dispatchEvent(new Event("pageChanged"));
      }
      
      private function _8184() : void
      {
         var _loc1_:Number = NaN;
         this._8167 = false;
         if(!this._8195)
         {
            return;
         }
         this._8183 = this._8159;
         if(this._8183 > this._8186 - 1)
         {
            this._8183 = this._8186 - 1;
         }
         this._8160();
         this._8164 = this._8168[this._8183];
         if(this._8182 > 0 && Boolean(stage))
         {
            if(this._8151)
            {
               _loc1_ = this._8195.verticalScrollPosition;
            }
            else
            {
               _loc1_ = this._8195.horizontalScrollPosition;
            }
            this._8181(_loc1_,this._8164);
         }
         else if(this._8151)
         {
            this._8195.verticalScrollPosition = this._8164;
         }
         else
         {
            this._8195.horizontalScrollPosition = this._8164;
         }
         this._8159 = NO_PROPOSED_PAGE;
      }
      
      private function _8160() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         if(this._8186 > 1)
         {
            if(this._8187 < this._8186 - 1)
            {
               _loc4_ = _loc2_ = true;
            }
            if(this._8187 > 0)
            {
               _loc3_ = _loc1_ = true;
            }
         }
         if(this._8180)
         {
            this._8180.enabled = _loc1_;
            this._8180.visible = !this._8156 || _loc1_;
            this._8180.includeInLayout = !this._8156 || _loc1_;
         }
         if(this._8179)
         {
            this._8179.enabled = _loc2_;
            this._8179.visible = !this._8156 || _loc2_;
            this._8179.includeInLayout = !this._8156 || _loc2_;
         }
      }
      
      override protected function _8189(param1:Object) : void
      {
         super._8189(param1);
         this._8170();
      }
      
      override protected function _8190(param1:Object) : void
      {
         this._8163();
         super._8190(param1);
      }
      
      override protected function partAdded(param1:String, param2:Object) : void
      {
         super.partAdded(param1,param2);
         if(param2 == this._8180)
         {
            this._8180.addEventListener(MouseEvent.CLICK,this._8169);
         }
         else if(param2 == this._8179)
         {
            this._8179.addEventListener(MouseEvent.CLICK,this._8172);
         }
      }
      
      override protected function partRemoved(param1:String, param2:Object) : void
      {
         super.partRemoved(param1,param2);
         if(param2 == this._8180)
         {
            this._8180.removeEventListener(MouseEvent.CLICK,this._8169);
         }
         else if(param2 == this._8179)
         {
            this._8179.removeEventListener(MouseEvent.CLICK,this._8172);
         }
      }
      
      protected function _8174(param1:MouseEvent) : void
      {
         if(!this._8195)
         {
            return;
         }
         this._8197(this._8186 - 1);
      }
      
      protected function _8166(param1:MouseEvent) : void
      {
         if(!this._8195)
         {
            return;
         }
         this._8197(0);
      }
      
      protected function _8172(param1:MouseEvent) : void
      {
         if(!this._8195)
         {
            return;
         }
         this._8197(Math.min(this._8186 - 1,this._8187 + 1));
      }
      
      protected function _8169(param1:MouseEvent) : void
      {
         if(!this._8195)
         {
            return;
         }
         this._8197(this._8187 - 1);
      }
      
      private function _8152(param1:MouseEvent) : void
      {
         var _loc2_:_1131 = this._8195;
         if(param1.isDefaultPrevented() || !_loc2_ || !_loc2_.visible)
         {
            return;
         }
         if(param1.delta > 0)
         {
            this._8197(this._8187 - 1);
         }
         else
         {
            this._8197(Math.min(this._8186 - 1,this._8187 + 1));
         }
         param1.preventDefault();
      }
      
      public function get _2249() : int
      {
         return !!this._8195 ? 1 : 0;
      }
      
      public function set _13971(param1:int) : void
      {
         this._13974 = param1;
      }
      
      public function get _13971() : int
      {
         return this._13974;
      }
      
      private function _8177(param1:int) : void
      {
         throw new RangeError("索引:\"" + param1 + "\"超出可视元素索引范围");
      }
      
      public function getElementAt(param1:int) : _1133
      {
         if(Boolean(this._8195) && param1 == 0)
         {
            return this._8195;
         }
         this._8177(param1);
         return null;
      }
      
      public function getElementIndex(param1:_1133) : int
      {
         if(param1 != null && param1 == this._8195)
         {
            return 0;
         }
         return -1;
      }
      
      public function _8171(param1:_1133) : Boolean
      {
         if(param1 != null && param1 == this._8195)
         {
            return true;
         }
         return false;
      }
      
      private function _8154() : void
      {
         throw new Error("此方法在PageNavigator组件内不可用!");
      }
      
      public function addElement(param1:_1133) : _1133
      {
         this._8154();
         return null;
      }
      
      public function addElementAt(param1:_1133, param2:int) : _1133
      {
         this._8154();
         return null;
      }
      
      public function removeElement(param1:_1133) : _1133
      {
         this._8154();
         return null;
      }
      
      public function removeElementAt(param1:int) : _1133
      {
         this._8154();
         return null;
      }
      
      public function _2426() : void
      {
         this._8154();
      }
      
      public function setElementIndex(param1:_1133, param2:int) : void
      {
         this._8154();
      }
      
      public function swapElements(param1:_1133, param2:_1133) : void
      {
         this._8154();
      }
      
      public function swapElementsAt(param1:int, param2:int) : void
      {
         this._8154();
      }
   }
}

