package _953
{
   import _1038._1037;
   import _1045.Group;
   import _1045._1105;
   import _11254._11253;
   import _1404._1407;
   import _14106.HelperLine;
   import _14106.Line;
   import _14110.Ruler;
   import _51._50;
   import _51._79;
   import _579._580;
   import _586._596;
   import _639._642;
   import _648._665;
   import _721._763;
   import _73.SymbolType;
   import _755._760;
   import _790._811;
   import _825._827;
   import _844._852;
   import _877._885;
   import _877._887;
   import _97._100;
   import egret.core._1140;
   import flash.geom.Point;
   
   public class _960 extends Group
   {
      public static var _5366:_827 = new _827(_100._2258);
      
      public static var _5350:_957 = new _957();
      
      public static var _4313:_852 = new _852();
      
      public static var _5347:_887 = new _887();
      
      private var rulerSign:Class;
      
      protected var _6782:_952;
      
      protected var _6781:_1140;
      
      protected var _6783:Group;
      
      protected var _6780:Group;
      
      public var canvas:_955;
      
      public var _3198:_954;
      
      public var _5273:_958;
      
      public var _5098:_956;
      
      public var _5357:Group;
      
      public var _5361:Group;
      
      public var _4269:_885;
      
      public var _11395:_11253;
      
      public var _5086:_811;
      
      private var _14846:uint = 19;
      
      private var _14820:Ruler;
      
      private var _14821:Ruler;
      
      public var _14626:HelperLine;
      
      private var _14845:Group;
      
      protected var _6768:_760;
      
      protected var _4133:_665;
      
      protected var _5625:_642;
      
      protected var _6779:_50;
      
      protected var _6778:Boolean = false;
      
      public var _4901:Boolean = false;
      
      protected var _6787:Number;
      
      protected var _6786:Number;
      
      protected var _6790:Boolean = true;
      
      public var _2000:_763;
      
      private var _3147:Number;
      
      private var _3146:Number;
      
      protected var _5372:Number = 1;
      
      public function _960()
      {
         this.rulerSign = _960_rulerSign;
         this._6782 = new _952();
         this._6781 = new _1140();
         this._6783 = new Group();
         this._6780 = new Group();
         this.canvas = new _955();
         this._5273 = new _958();
         this._5098 = new _956();
         this._5357 = new Group();
         this._5361 = new Group();
         this._4269 = new _885();
         this._11395 = new _11253();
         this._5086 = new _811();
         super();
         doubleClickEnabled = true;
         this._5625 = _642.getInstance();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         addElement(this._6782);
         addElement(this._6781);
         addElement(this._6780);
         addElement(this._5357);
         addElement(this._5361);
         addElement(this._4428);
         this._4428.width = 0;
         this._4428.height = 0;
         this._5357.width = 0;
         this._5357.height = 0;
         this._5361.width = 0;
         this._5361.height = 0;
         if(this.canvas)
         {
            this._4428.addElement(this.canvas);
         }
         this._4428.addElement(this._5273);
         this._4428.addElement(this._5086);
         this._4428.addElement(this._4269);
         this._4428.addElement(this._11395);
         this._4428.addElement(this._5098);
         this._14845 = new Group();
         this._14845.percentWidth = 100;
         this._14820 = new Ruler(this._14846);
         this._14820.x = this._14846;
         this._14820._14833 = Ruler.HORIZONTAL;
         this._14845.addElement(this._14820);
         this._14821 = new Ruler(this._14846);
         this._14821.y = this._14846;
         this._14821._14833 = Ruler.VERTICAL;
         this._14845.addElement(this._14821);
         var _loc1_:_1105 = new _1105();
         _loc1_.source = new this.rulerSign();
         this._14845.addElement(_loc1_);
         this._14626 = new HelperLine(this._14820,this._14821);
         this._14845.includeInLayout = false;
         this._14626.includeInLayout = false;
      }
      
      public function init(param1:Array) : void
      {
         this._14844(param1);
         this._14616();
         this._14611();
         this._14610();
         this._14612();
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._6778)
         {
            this._6778 = false;
            this._5273.dataProvider = new _1037(this._6779._1780);
            _5350.dataProvider = new _1037();
         }
         if(this._6790)
         {
            this._6790 = false;
            this._3345();
         }
      }
      
      public function _6788() : void
      {
         this._6790 = true;
         _2466();
      }
      
      public function _6695(param1:Number, param2:Number) : void
      {
         this._6787 = param1;
         this._6786 = param2;
         this._6782.draw(param1,param2,this._2000 == null || this._2000.type == _763.TYPE_NEW);
         this._6781.graphics.clear();
         this._6781.graphics.beginFill(_642.getInstance().backgroundColor,0.3);
         this._6781.graphics.drawRect(0,0,this._6787,this._6786);
         this._6781.graphics.endFill();
         this._14626._14799(this._6787,this._6786,this._14843._4884);
      }
      
      public function clearRulerLines() : void
      {
         this._14626.clear();
      }
      
      public function _14844(param1:Array) : void
      {
         var _loc3_:Object = null;
         var _loc4_:Point = null;
         var _loc5_:Line = null;
         var _loc2_:int = int(param1.length);
         for each(_loc3_ in param1)
         {
            if(_loc3_.type == HelperLine.TYPE_H)
            {
               _loc4_ = new Point(0,_loc3_.value / 10);
            }
            else
            {
               _loc4_ = new Point(_loc3_.value / 10,0);
            }
            (_loc5_ = this._14626._14818(_loc4_,_loc3_.type))._14640 = {
               "x":_loc4_.x,
               "y":_loc4_.y
            };
         }
      }
      
      public function _14616() : void
      {
         if(this._5625.useruler)
         {
            if(!this._14626.parent)
            {
               addElement(this._14626);
               addElement(this._14845);
            }
         }
         else if(this._14626.parent)
         {
            removeElement(this._14626);
            removeElement(this._14845);
         }
      }
      
      public function _14610() : void
      {
         this._14626._8140(this._5625.assistLineenable);
      }
      
      public function _14611() : void
      {
         this._14626.visible = this._5625.assistLine;
      }
      
      public function _14612() : void
      {
         this._14626._9788 = this._5625.assistLineColor;
         this._14626._14797();
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         if(this._6768)
         {
            this._4428.x = (this._6787 - this._3233 * this._6768.zoom) / 2 + this._4871;
            this._4428.y = (this._6786 - this._3231 * this._6768.zoom) / 2 + this._4872;
            if(this.canvas)
            {
               this.canvas.scaleX = this._6768.zoom;
               this.canvas.scaleY = this._6768.zoom;
            }
            this._5273.scaleX = this._6768.zoom;
            this._5273.scaleY = this._6768.zoom;
            this._5086.scaleX = this._6768.zoom;
            this._5086.scaleY = this._6768.zoom;
            if(_596.RENDER_ONE_BITMAP)
            {
               this._3443._5252(this._6787,this._6786,this._6768.zoom,this._4871 - this._3233 * this._6768.zoom / 2,this._4872 - this._3231 * this._6768.zoom / 2);
            }
            else
            {
               this._5357.scaleX = this._6768.zoom;
               this._5357.scaleY = this._6768.zoom;
               this._5361.scaleX = this._6768.zoom;
               this._5361.scaleY = this._6768.zoom;
               this._5357.x = this._4428.x;
               this._5357.y = this._4428.y;
               this._5361.x = this._4428.x;
               this._5361.y = this._4428.y;
            }
            this._5098.x = -this._4428.x;
            this._5098.y = -this._4428.y;
            this._5098.width = this._6787;
            this._5098.height = this._6786;
            this._6782._6112(this._4871);
            this._6782._6113(this._4872);
            this._6782.scale = this._6768.zoom;
            this._14820._14785(this._4428.x - this._14846,0,this._6768.zoom);
            this._14821._14785(0,this._4428.y - this._14846,this._6768.zoom);
            this._14626._14785(this._4428.x - this._14846,this._4428.y - this._14846,this._6768.zoom);
            this._4269._6106(this._6768.zoom);
            this._11395._6106(this._6768.zoom);
            if(Boolean(this.canvas) && Boolean(this._2000))
            {
               this.canvas.x = this._2000.x * this._6768.zoom;
               this.canvas.y = this._2000.y * this._6768.zoom;
            }
         }
      }
      
      public function active() : void
      {
         if(!this._4428.contains(_5366))
         {
            this._4428.addElement(_5366);
            this._4428.addElement(_5350);
            this._4428.addElement(_4313);
            this._4428.addElement(_5347);
         }
      }
      
      public function dispose() : void
      {
         this._5273.dispose();
         this._5098.dispose();
         _5366.dispose();
         _5350.dispose();
         _4313.dispose();
         _5347.dispose();
      }
      
      public function _5373() : void
      {
         if(_5350._6777(_5366._1837))
         {
            _5366.visible = false;
            _5350._6229(_5366._1837);
         }
         else
         {
            _5366.visible = true;
            _5350._6776();
         }
      }
      
      public function _3348(param1:Point) : void
      {
         this._4871 = param1.x;
         this._4872 = param1.y;
      }
      
      public function _3387(param1:Number, param2:Point) : void
      {
         var _loc3_:Number = (this._6768.zoom - param1) / this._6768.zoom;
         this._5372 = _loc3_;
         this._6768.zoom = param1;
         this._4871 += param2.x * _loc3_;
         this._4872 += param2.y * _loc3_;
      }
      
      public function _5340() : void
      {
         if(this._6779 == this._4133._2865)
         {
            if(this._6779._1811 != SymbolType.STAGE)
            {
               this._2000 = this._6779._2000;
            }
            return;
         }
         this._6779 = this._4133._2865;
         if(this._6779)
         {
            this._6778 = true;
            this._6779._1751();
            if(this._6779._1811 != SymbolType.STAGE)
            {
               this._2000 = this._6779._2000;
            }
         }
         _2466();
      }
      
      public function _3345() : void
      {
         if(this.canvas == null)
         {
            return;
         }
         this.canvas._2000 = this._2000;
         if(this._2000)
         {
            this.canvas.x = this._2000.x * this._6768.zoom;
            this.canvas.y = this._2000.y * this._6768.zoom;
         }
      }
      
      public function get _3233() : Number
      {
         return !!this.canvas ? this.canvas.width : 0;
      }
      
      public function get _3231() : Number
      {
         return !!this.canvas ? this.canvas.height : 0;
      }
      
      public function set _2871(param1:_665) : void
      {
         if(this._4133 == param1)
         {
            return;
         }
         this._4133 = param1;
         this._6768 = this._4133._3286;
         this._5340();
      }
      
      public function get _2762() : _50
      {
         return this._6779;
      }
      
      public function get _3286() : _760
      {
         return this._6768;
      }
      
      public function set _5268(param1:_79) : void
      {
         if(_5366._1837 == param1)
         {
            return;
         }
         _5366._1837 = param1;
         this._5273._5021 = param1;
         this._5373();
      }
      
      public function get _4428() : Group
      {
         return this._6783;
      }
      
      public function get _4871() : Number
      {
         return this._6768._5943;
      }
      
      public function set _4871(param1:Number) : void
      {
         this._6768._5943 = param1;
         invalidateDisplayList();
      }
      
      public function get _4872() : Number
      {
         return this._6768._5942;
      }
      
      public function set _4872(param1:Number) : void
      {
         this._6768._5942 = param1;
         invalidateDisplayList();
      }
      
      public function set zoom(param1:Number) : void
      {
         this._6768.zoom = param1;
         invalidateDisplayList();
      }
      
      public function _11422() : Boolean
      {
         return mouseX > 0 && mouseX < this._6787 && mouseY > 0 && mouseY < this._6786;
      }
      
      private function get _3443() : _596
      {
         return _1407.getInstance(_596) as _596;
      }
      
      public function get _14843() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
   }
}

