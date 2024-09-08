package _10259
{
   import _1038._1037;
   import _1045.CheckBox;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _54._10245;
   import egret.utils.tr;
   
   public class _10260 extends Group
   {
      private var _10406:Group;
      
      private var _10405:Label;
      
      public var _10409:DropDownList;
      
      private var _10408:_1037;
      
      private var _10396:Group;
      
      private var _10397:Label;
      
      public var _10403:DropDownList;
      
      private var _10400:_1037;
      
      private var _10398:Group;
      
      private var _10399:Label;
      
      public var _10404:DropDownList;
      
      private var _10401:_1037;
      
      private var _10407:Group;
      
      private var _10410:Label;
      
      public var _10342:CheckBox;
      
      private var _4761:_10245;
      
      public function _10260()
      {
         this.speed0 = tr("ActionPropertyGroup.speed0");
         this.speed1 = tr("ActionPropertyGroup.speed1");
         this.speed2 = tr("ActionPropertyGroup.speed2");
         this.speed3 = tr("ActionPropertyGroup.speed3");
         this.speed4 = tr("ActionPropertyGroup.speed4");
         this.intensity0 = tr("ActionPropertyGroup.intensity0");
         this.intensity1 = tr("ActionPropertyGroup.intensity1");
         this.intensity2 = tr("ActionPropertyGroup.intensity2");
         this.intensity3 = tr("ActionPropertyGroup.intensity3");
         this.direction0 = tr("ActionPropertyGroup.directionShake0");
         this.direction1 = tr("ActionPropertyGroup.directionShake1");
         this.direction2 = tr("ActionPropertyGroup.directionShake2");
         this._10405 = new Label();
         this._10409 = new DropDownList();
         this._10408 = new _1037();
         this._10397 = new Label();
         this._10403 = new DropDownList();
         this._10400 = new _1037();
         this._10399 = new Label();
         this._10404 = new DropDownList();
         this._10401 = new _1037();
         this._10410 = new Label();
         this._10342 = new CheckBox();
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.percentWidth = 100;
         var _loc1_:_1197 = new _1197();
         this.layout = _loc1_;
         this._10405.text = tr("ActionPropertyGroup.speed");
         this._10409.percentWidth = 100;
         this._10408.source = [this.speed0,this.speed1,this.speed2,this.speed3,this.speed4];
         this._10409.dataProvider = this._10408;
         this._10409._3854 = false;
         this._10409.selectedIndex = 0;
         this._10406 = this._2414();
         this._10406.addElement(this._10405);
         this._10406.addElement(this._10409);
         this._10397.text = tr("ActionPropertyGroup.intensity");
         this._10403.percentWidth = 100;
         this._10400.source = [this.intensity0,this.intensity1,this.intensity2,this.intensity3];
         this._10403.dataProvider = this._10400;
         this._10403._3854 = false;
         this._10403.selectedIndex = 0;
         this._10396 = this._2414();
         this._10396.addElement(this._10397);
         this._10396.addElement(this._10403);
         this._10399.text = tr("ActionPropertyGroup.direction");
         this._10404.percentWidth = 100;
         this._10401.source = [this.direction0,this.direction1,this.direction2];
         this._10404.dataProvider = this._10401;
         this._10404._3854 = false;
         this._10404.selectedIndex = 0;
         this._10398 = this._2414();
         this._10398.addElement(this._10399);
         this._10398.addElement(this._10404);
         this._10410.text = tr("ActionPropertyGroup.loop");
         this._10342.selected = true;
         this._10407 = this._2414();
         this._10407.addElement(this._10410);
         this._10407.addElement(this._10342);
         addElement(this._10406);
         addElement(this._10396);
         addElement(this._10398);
         addElement(this._10407);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._2894();
      }
      
      private function _2894() : void
      {
         if(!this._4761)
         {
            return;
         }
         this._10409.selectedIndex = this._10402(this._4761.speed);
         this._10403.selectedIndex = this._10395(this._4761.intensity);
         this._10404.selectedIndex = this._4761.direction;
         this._10342.selected = this._4761.loop;
      }
      
      public function set model(param1:_10245) : void
      {
         this._4761 = param1;
         this.invalidateDisplayList();
      }
      
      private function _2414() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         var _loc2_:_1189 = new _1189();
         _loc2_.verticalAlign = _1196.MIDDLE;
         _loc2_.padding = 10;
         _loc2_._2410 = 5;
         _loc1_.layout = _loc2_;
         return _loc1_;
      }
      
      private function _10402(param1:int) : int
      {
         var _loc2_:int = 4;
         switch(param1)
         {
            case _10245.SPEED_0:
               _loc2_ = 0;
               break;
            case _10245.SPEED_1:
               _loc2_ = 1;
               break;
            case _10245.SPEED_2:
               _loc2_ = 2;
               break;
            case _10245.SPEED_3:
               _loc2_ = 3;
               break;
            case _10245.SPEED_4:
               _loc2_ = 4;
         }
         return _loc2_;
      }
      
      private function _10395(param1:int) : int
      {
         var _loc2_:int = 3;
         switch(param1)
         {
            case _10245.INTENSITY_0:
               _loc2_ = 0;
               break;
            case _10245.INTENSITY_1:
               _loc2_ = 1;
               break;
            case _10245.INTENSITY_2:
               _loc2_ = 2;
               break;
            case _10245.INTENSITY_3:
               _loc2_ = 3;
         }
         return _loc2_;
      }
      
      public function _10335(param1:int) : int
      {
         var _loc2_:int = _10245.SPEED_4;
         switch(param1)
         {
            case 0:
               _loc2_ = _10245.SPEED_0;
               break;
            case 1:
               _loc2_ = _10245.SPEED_1;
               break;
            case 2:
               _loc2_ = _10245.SPEED_2;
               break;
            case 3:
               _loc2_ = _10245.SPEED_3;
               break;
            case 4:
               _loc2_ = _10245.SPEED_4;
         }
         return _loc2_;
      }
      
      public function _10317(param1:int) : int
      {
         var _loc2_:int = _10245.INTENSITY_3;
         switch(param1)
         {
            case 0:
               _loc2_ = _10245.INTENSITY_0;
               break;
            case 1:
               _loc2_ = _10245.INTENSITY_1;
               break;
            case 2:
               _loc2_ = _10245.INTENSITY_2;
               break;
            case 3:
               _loc2_ = _10245.INTENSITY_3;
         }
         return _loc2_;
      }
   }
}

