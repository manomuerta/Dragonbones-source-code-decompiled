package _834
{
   import _1045.Group;
   import _1045._1082;
   import _1045._1084;
   import _1185._1189;
   import _1185._1196;
   import _822._12898;
   
   public class _12901 extends _1084
   {
      public var _8130:Class;
      
      public var menu:Class;
      
      private var bg:_1082;
      
      public var _2440:Group;
      
      private var group:Group;
      
      public function _12901()
      {
         this._8130 = _12898;
         this.menu = SMenu;
         super();
      }
      
      override protected function _2438() : void
      {
         this.group = new Group();
         this.group.minHeight = 23;
         this.group.minWidth = 23;
         this.group.left = 0;
         this.group.right = 0;
         this.addElement(this.group);
         this.bg = new _1082();
         this.bg.fillColor = 15658734;
         this.bg._2529 = 0;
         this.bg.left = this.bg.right = this.bg.top = this.bg.bottom = 0;
         this.group.addElement(this.bg);
         this._2440 = new Group();
         var _loc1_:_1189 = new _1189();
         _loc1_.verticalAlign = _1196.JUSTIFY;
         _loc1_.gap = 0;
         this._2440.layout = _loc1_;
         this._2440.top = 0;
         this._2440.bottom = 0;
         this._2440.left = 0;
         this._2440.right = 0;
         this.group.addElement(this._2440);
      }
   }
}

import _1038._1043;
import _1045.Menu;
import _822._12899;
import _834._12902;
import _834._12903;

class SMenu extends Menu
{
   public function SMenu()
   {
      super();
      this.skinName = _12903;
      this.itemRenderer = _12899;
      this._2514 = _12902;
   }
   
   override protected function _2476() : void
   {
      super._2476();
      this._2939();
   }
   
   private function _2939() : void
   {
      var _loc1_:_1043 = null;
      var _loc2_:int = 0;
      var _loc3_:int = 0;
      var _loc4_:_12899 = null;
      if(Boolean(_2490) && Boolean(_2490.dataProvider))
      {
         _loc1_ = this._2490.dataProvider as _1043;
         if(_loc1_)
         {
            _loc2_ = 0;
            _loc3_ = _loc1_.length;
            while(_loc2_ < _loc3_)
            {
               _loc4_ = this._2490.getElementAt(_loc2_) as _12899;
               if(_loc4_)
               {
                  _loc4_._2570();
               }
               _loc2_++;
            }
         }
      }
   }
}

