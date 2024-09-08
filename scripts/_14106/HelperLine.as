package _14106
{
   import _1045.Group;
   import _1404._1405;
   import _14110.Ruler;
   import _6.Context;
   import egret.managers._1198;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class HelperLine extends Group
   {
      public static const TYPE_H:uint = 0;
      
      public static const TYPE_V:uint = 1;
      
      private static const LINE_OVER_COLOR:uint = 65535;
      
      private static const HELP_POINT:Point = new Point();
      
      private var _14820:Ruler;
      
      private var _14821:Ruler;
      
      private var _14819:Array;
      
      private var _14817:Array;
      
      private var _2511:Group;
      
      private var _6525:Group;
      
      private var _14800:Point;
      
      private var _14809:int;
      
      private var _14822:int;
      
      private var _14823:int;
      
      private var cursors:String;
      
      private var _14810:Boolean = false;
      
      private var _14816:Rectangle;
      
      private var _14804:Ruler;
      
      private var _14803:Line;
      
      private var _14805:Line;
      
      private var _14815:Line;
      
      private var _9787:uint = 4915199;
      
      private var _14793:Number = 0;
      
      private var _14794:Number = 0;
      
      private var _14787:Number = 1;
      
      public var _14786:uint = 5;
      
      public function HelperLine(param1:Ruler, param2:Ruler)
      {
         super();
         this.mouseEnabled = false;
         this._2511 = new Group();
         this.addElement(this._2511);
         this._6525 = new Group();
         this.addElement(this._6525);
         this._14819 = [];
         this._14817 = [];
         this._14820 = param1;
         this._14821 = param2;
         this._14820.addEventListener(MouseEvent.MOUSE_DOWN,this._14796);
         this._14821.addEventListener(MouseEvent.MOUSE_DOWN,this._14796);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this._14801);
         this.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._14802);
      }
      
      public function get _9788() : uint
      {
         return this._9787;
      }
      
      public function set _9788(param1:uint) : void
      {
         if(this._9787 == param1)
         {
            return;
         }
         this._9787 = param1;
      }
      
      private function _14796(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_DOWN:
               if(visible == false)
               {
                  return;
               }
               param1.stopImmediatePropagation();
               this._14804 = param1.target as Ruler;
               if(stage)
               {
                  Context.getInstance().stage.addEventListener(MouseEvent.MOUSE_MOVE,this._14796);
                  Context.getInstance().stage.addEventListener(MouseEvent.MOUSE_UP,this._14796);
               }
               this.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._14802);
               break;
            case MouseEvent.MOUSE_MOVE:
               HELP_POINT.x = param1.stageX;
               HELP_POINT.y = param1.stageY;
               if(this._14804 == this._14820)
               {
                  this._14800 = this._2511.globalToLocal(HELP_POINT);
                  if(this._14803)
                  {
                     this._14803.y = this._14800.y;
                  }
                  else
                  {
                     this.cursors = _1405.DESKTOP_RESIZE_NS;
                     this._14809 = TYPE_H;
                     this._14803 = this._14818(this._14800,this._14809);
                     this._14803.removeEventListener(MouseEvent.MOUSE_OUT,this._14811);
                     this._14803.removeEventListener(MouseEvent.MOUSE_OVER,this._14806);
                  }
                  _14108.show("Y:" + int(this._14803.y) + "px",this._14803);
               }
               else
               {
                  this._14800 = this._6525.globalToLocal(HELP_POINT);
                  if(this._14803)
                  {
                     this._14803.x = this._14800.x;
                  }
                  else
                  {
                     this.cursors = _1405.DESKTOP_RESIZE_EW;
                     this._14809 = TYPE_V;
                     this._14803 = this._14818(this._14800,this._14809);
                     this._14803.removeEventListener(MouseEvent.MOUSE_OUT,this._14811);
                     this._14803.removeEventListener(MouseEvent.MOUSE_OVER,this._14806);
                  }
                  _14108.show("X:" + int(this._14803.x) + "px",this._14803);
               }
               if(_1198.cursor == _1405.AUTO)
               {
                  _1198.setCursor(this.cursors);
               }
               break;
            case MouseEvent.MOUSE_UP:
               _14108.hide();
               if(this._14803)
               {
                  if(this._14808(param1.stageX,param1.stageY))
                  {
                     this._14803._14640 = {
                        "x":this._14800.x,
                        "y":this._14800.y
                     };
                     this._14803.stopDrag();
                     this._14803.color = this._9788;
                     this._14803._6107();
                     dispatchEvent(new RulerEvent(RulerEvent._14622,this._14798(this._14800,this._14809)));
                     this._14803.addEventListener(MouseEvent.MOUSE_OUT,this._14811);
                     this._14803.addEventListener(MouseEvent.MOUSE_OVER,this._14806);
                     _14108._14812(tr("StageView.Auxiliary.HelperLine.Tips"),this._14803);
                  }
                  else
                  {
                     this._14807(this._14803);
                  }
               }
               this._14803 = null;
               Context.getInstance().stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._14796);
               Context.getInstance().stage.addEventListener(MouseEvent.MOUSE_UP,this._14796);
               this.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._14802);
               if(!this._14814)
               {
                  this.mouseChildren = false;
               }
         }
      }
      
      private function _14801(param1:MouseEvent) : void
      {
         var _loc2_:Point = null;
         var _loc3_:Object = null;
         if(param1.type == MouseEvent.MOUSE_DOWN && param1.target is Line)
         {
            param1.stopImmediatePropagation();
            this._14805 = param1.target as Line;
            this._14800 = new Point(this._14805._14640.x,this._14805._14640.y);
            this._14809 = this._14805.type;
            this._14815 = this._14818(this._14800,this._14805.type,15329769,false);
            if(stage)
            {
               Context.getInstance().stage.addEventListener(MouseEvent.MOUSE_MOVE,this._14801);
               Context.getInstance().stage.addEventListener(MouseEvent.MOUSE_UP,this._14801);
            }
            this.removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._14802);
            this._14805.removeEventListener(MouseEvent.MOUSE_OUT,this._14811);
            this._14815.removeEventListener(MouseEvent.MOUSE_OUT,this._14811);
            this._14815.removeEventListener(MouseEvent.MOUSE_OVER,this._14806);
            _14108._14813();
         }
         else if(param1.type == MouseEvent.MOUSE_MOVE)
         {
            if(this._14815)
            {
               HELP_POINT.x = param1.stageX;
               HELP_POINT.y = param1.stageY;
               _loc2_ = this._14815.type == TYPE_H ? this._2511.globalToLocal(HELP_POINT) : this._6525.globalToLocal(HELP_POINT);
               if(this._14815.type == TYPE_H)
               {
                  this.cursors = _1405.DESKTOP_RESIZE_NS;
                  this._14815.y = _loc2_.y;
                  _14108.show("Y:" + int(this._14815.y) + "px",this._14815);
               }
               else
               {
                  this.cursors = _1405.DESKTOP_RESIZE_EW;
                  this._14815.x = _loc2_.x;
                  _14108.show("X:" + int(this._14815.x) + "px",this._14815);
               }
               if(_1198.cursor != this.cursors)
               {
                  _1198.setCursor(this.cursors);
               }
            }
         }
         else if(param1.type == MouseEvent.MOUSE_UP)
         {
            if(Boolean(this._14805) && Boolean(this._14815))
            {
               if(this._14808(param1.stageX,param1.stageY))
               {
                  this._14805.x = this._14815.x;
                  this._14805.y = this._14815.y;
                  this._14805._14640 = {
                     "x":this._14805.x,
                     "y":this._14805.y
                  };
                  this._14805.addEventListener(MouseEvent.MOUSE_OUT,this._14811);
                  this._14807(this._14815);
                  _loc3_ = this._14798(this._14800,this._14809,new Point(this._14805._14640.x,this._14805._14640.y));
                  dispatchEvent(new RulerEvent(RulerEvent._14618,_loc3_));
               }
               else
               {
                  dispatchEvent(new RulerEvent(RulerEvent._14615,this._14798(this._14800,this._14809)));
                  this._14807(this._14805);
                  this._14807(this._14815);
               }
            }
            this._14805 = null;
            this._14815 = null;
            Context.getInstance().stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._14801);
            Context.getInstance().stage.removeEventListener(MouseEvent.MOUSE_UP,this._14801);
            this.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN,this._14802);
            _14108.hide();
         }
      }
      
      private function _14802(param1:MouseEvent) : void
      {
         var _loc2_:Line = null;
         if(param1.target is Line)
         {
            param1.stopImmediatePropagation();
            _loc2_ = param1.target as Line;
            this._14807(_loc2_);
            this._14800 = new Point(_loc2_._14640.x,_loc2_._14640.y);
            this._14809 = _loc2_.type;
            dispatchEvent(new RulerEvent(RulerEvent._14615,this._14798(this._14800,this._14809)));
         }
      }
      
      public function _14818(param1:Point, param2:uint, param3:uint = 15329769, param4:Boolean = true) : Line
      {
         if(!this._14814)
         {
            this.mouseChildren = true;
         }
         var _loc5_:Point = param2 == TYPE_H ? this._2511.globalToLocal(param1) : this._6525.globalToLocal(param1);
         if(!param4)
         {
            _loc5_ = param1;
         }
         var _loc6_:Line;
         (_loc6_ = new Line()).color = param3;
         _loc6_.type = param2;
         if(param2 == TYPE_H)
         {
            _loc6_.thickness = 1 / this._2511.scaleY;
            _loc6_._6107(this._14823);
            _loc6_.y = _loc5_.y;
            this._14819.push(_loc6_);
            this._2511.addElement(_loc6_);
         }
         else
         {
            _loc6_.thickness = 1 / this._6525.scaleX;
            _loc6_._6107(this._14822);
            _loc6_.x = _loc5_.x;
            this._14817.push(_loc6_);
            this._6525.addElement(_loc6_);
         }
         _loc6_.name = param2.toString();
         _loc6_.addEventListener(MouseEvent.MOUSE_OVER,this._14806);
         _loc6_.addEventListener(MouseEvent.MOUSE_OUT,this._14811);
         return _loc6_;
      }
      
      private function _14806(param1:MouseEvent) : void
      {
         var _loc2_:Line = null;
         if(param1.currentTarget is Line)
         {
            _loc2_ = param1.currentTarget as Line;
            if(int(_loc2_.name) == TYPE_H)
            {
               _1198.setCursor(_1405.DESKTOP_RESIZE_NS);
            }
            else
            {
               _1198.setCursor(_1405.DESKTOP_RESIZE_EW);
            }
            _14108._14812(tr("StageView.Auxiliary.HelperLine.Tips"),_loc2_);
         }
      }
      
      private function _14811(param1:MouseEvent) : void
      {
         _1198.setCursor(_1405.AUTO);
         _14108._14813();
      }
      
      private function _14807(param1:Line) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Group = null;
         if(param1.type == TYPE_H)
         {
            _loc2_ = this._14819;
            _loc3_ = this._2511;
         }
         else
         {
            _loc2_ = this._14817;
            _loc3_ = this._6525;
         }
         var _loc4_:int = int(_loc2_.indexOf(param1));
         if(_loc4_ >= 0)
         {
            _loc2_.splice(_loc4_,1);
         }
         this.removeEventListener(MouseEvent.MOUSE_OVER,this._14806);
         this.removeEventListener(MouseEvent.MOUSE_OUT,this._14811);
         if(param1.parent)
         {
            _loc3_.removeElement(param1);
         }
      }
      
      public function clear() : void
      {
         this._2511._2426();
         this._6525._2426();
         this._14819.length = 0;
         this._14817.length = 0;
         this._14803 = null;
         this._14805 = null;
         this._14815 = null;
      }
      
      public function _14781(param1:Number, param2:Number, param3:Point = null) : Point
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc8_:Line = null;
         var _loc9_:Line = null;
         var _loc10_:Line = null;
         if(param3 == null)
         {
            param3 = new Point();
         }
         if(this.visible == false)
         {
            param3.x = Number.MAX_VALUE;
            param3.y = Number.MAX_VALUE;
            return param3;
         }
         var _loc6_:Number = Number.MAX_VALUE;
         var _loc7_:Number = Number.MAX_VALUE;
         for each(_loc10_ in this._14819)
         {
            _loc5_ = Math.abs(param2 - _loc10_.y);
            if(_loc5_ < _loc7_)
            {
               _loc7_ = _loc5_;
               _loc9_ = _loc10_;
            }
         }
         for each(_loc10_ in this._14817)
         {
            _loc4_ = Math.abs(param1 - _loc10_.x);
            if(_loc4_ < _loc6_)
            {
               _loc6_ = _loc4_;
               _loc8_ = _loc10_;
            }
         }
         param3.x = _loc8_ == null ? Number.MAX_VALUE : _loc8_.x;
         param3.y = _loc9_ == null ? Number.MAX_VALUE : _loc9_.y;
         return param3;
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._6525.x = int(this._14821.size + this._14793);
         this._2511.y = int(this._14821.size + this._14794);
         if(int(this._2511.scaleY * 100) == int(this._14787 * 100))
         {
            return;
         }
         this._2511.scaleY = this._14787;
         this._6525.scaleX = this._14787;
      }
      
      public function _14785(param1:Number, param2:Number, param3:Number) : void
      {
         this._14793 = param1;
         this._14794 = param2;
         this._14787 = param3;
         this.invalidateDisplayList();
      }
      
      public function _14797() : void
      {
         var _loc1_:Line = null;
         for each(_loc1_ in this._14819)
         {
            _loc1_.color = this._9788;
            _loc1_._6107();
         }
         for each(_loc1_ in this._14817)
         {
            _loc1_.color = this._9788;
            _loc1_._6107();
         }
      }
      
      private function _14798(param1:Point, param2:int, param3:Point = null) : Object
      {
         var _loc4_:Object = {};
         if(param2 == TYPE_H)
         {
            if(param3)
            {
               _loc4_ = {
                  "value":int(param1.y * 10),
                  "type":param2,
                  "mValue":int(param3.y * 10)
               };
            }
            else
            {
               _loc4_ = {
                  "value":int(param1.y * 10),
                  "type":param2
               };
            }
         }
         else if(param3)
         {
            _loc4_ = {
               "value":int(param1.x * 10),
               "type":param2,
               "mValue":int(param3.x * 10)
            };
         }
         else
         {
            _loc4_ = {
               "value":int(param1.x * 10),
               "type":param2
            };
         }
         return _loc4_;
      }
      
      public function _14799(param1:int, param2:int, param3:Rectangle = null) : void
      {
         var _loc4_:Line = null;
         this._14822 = param2;
         this._14823 = param1;
         this._14816 = param3.clone();
         if(this._14816)
         {
            this._14816.x += this._14820.size;
            this._14816.y += this._14821.size;
            this._14816.width -= this._14820.size;
            this._14816.height -= this._14821.size;
         }
         for each(_loc4_ in this._14819)
         {
            _loc4_.thickness = 1 / this._2511.scaleY;
            _loc4_._14756 = param1;
            _loc4_._6107();
         }
         for each(_loc4_ in this._14817)
         {
            _loc4_.thickness = 1 / this._6525.scaleX;
            _loc4_._14756 = param2;
            _loc4_._6107();
         }
      }
      
      private function _14808(param1:Number, param2:Number) : Boolean
      {
         if(!this._14816)
         {
            return true;
         }
         return this._14816.containsPoint(new Point(param1,param2));
      }
      
      public function _8140(param1:Boolean) : void
      {
         this._14810 = param1;
         this.mouseChildren = param1;
      }
      
      public function get _14814() : Boolean
      {
         return this._14810;
      }
   }
}

