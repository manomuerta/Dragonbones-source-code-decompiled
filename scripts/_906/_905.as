package _906
{
   import _1038._1037;
   import _1045.DropDownList;
   import _1045.Group;
   import _1045.Label;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._128;
   import _13503._13502;
   import _51._50;
   import _636.AnimationEvent;
   import _668._672;
   import _73.SymbolType;
   import egret.utils.tr;
   import flash.events.Event;
   
   public class _905 extends Group
   {
      private var _4761:_672;
      
      public var _4444:Label;
      
      public var _6195:Label;
      
      public var _6502:Label;
      
      public var _6496:DropDownList;
      
      public var _5544:_128;
      
      private var _6191:Group;
      
      private var _6192:Group;
      
      private var _6501:Group;
      
      private var _6498:Group;
      
      private var _6499:Array;
      
      private var _6495:_1037;
      
      private var _6500:_910;
      
      private var _13397:_13210;
      
      public function _905()
      {
         this._4444 = new Label();
         this._6195 = new Label();
         this._6502 = new Label();
         this._6496 = new DropDownList();
         this._5544 = new _128();
         this._6499 = [];
         this._6495 = new _1037();
         super();
      }
      
      override protected function _2438() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Label = null;
         super._2438();
         layout = new _1197();
         (layout as _1197).gap = 8;
         percentWidth = 100;
         _loc1_ = PropertyPanel._14765;
         this._6191 = this._2414();
         this._6191.height = 22;
         this._6191.percentWidth = 100;
         _loc2_ = new Label();
         _loc2_.width = _loc1_;
         _loc2_.text = tr("Property.armature.name");
         this._6191.addElement(_loc2_);
         this._6191.addElement(this._4444);
         this._6192 = this._2414();
         this._6192.percentWidth = 100;
         var _loc3_:Label = new Label();
         _loc3_.width = _loc1_;
         _loc3_.text = tr("Property.type");
         this._6192.addElement(_loc3_);
         this._6192.addElement(this._6195);
         this._6500 = new _910();
         this._6500.percentWidth = 100;
         this._6501 = this._2414();
         this._6501.percentWidth = 100;
         var _loc4_:Label;
         (_loc4_ = new Label()).width = _loc1_;
         _loc4_.text = tr("Property.armature.frameRate");
         this._6501.addElement(_loc4_);
         this._6501.addElement(this._6502);
         this._6498 = this._2414();
         this._6498.percentWidth = 100;
         var _loc5_:Label;
         (_loc5_ = new Label()).width = _loc1_;
         _loc5_.text = tr("Property.armature.defaultAnimation");
         this._6496.percentWidth = 100;
         this._6496._6146 = this._6497;
         this._6496.addEventListener(Event.CHANGE,this._6494);
         this._6496._3854 = false;
         this._6498.addElement(_loc5_);
         this._6498.addElement(this._6496);
         this._13397 = new _13210();
         addElement(this._6191);
         addElement(this._6192);
         addElement(this._6500);
         addElement(this._6501);
         addElement(this._6498);
         addElement(this._13397);
         this.refresh();
      }
      
      private function _2414() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         var _loc2_:_1189 = new _1189();
         _loc2_.verticalAlign = _1196.MIDDLE;
         _loc1_.layout = _loc2_;
         return _loc1_;
      }
      
      private function _6497(param1:Object) : String
      {
         var _loc2_:_50 = null;
         if(Boolean(this._4761) && Boolean(this._4761._1886))
         {
            _loc2_ = this._4761._1886;
            if(Boolean(_loc2_) && Boolean(_loc2_._13656(param1 as String)))
            {
               return param1 as String;
            }
         }
         return tr("Property.display.empty");
      }
      
      public function get model() : _672
      {
         return this._4761;
      }
      
      public function set model(param1:_672) : void
      {
         this._4761 = param1;
         this.refresh();
      }
      
      private function refresh() : void
      {
         var _loc1_:_50 = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_13502 = null;
         if(this._6498 == null || this._4761 == null)
         {
            return;
         }
         this._6498.visible = false;
         this._6498.includeInLayout = false;
         this._6500.visible = false;
         this._6500.includeInLayout = false;
         this._13397.model = this._4761;
         this._13397.visible = true;
         this._13397.includeInLayout = true;
         if(this._4761._1886)
         {
            this._4444.text = this._4761._1886.name;
            switch(this._4761._1886._1811)
            {
               case SymbolType.ARMATURE:
                  this._6195.text = tr("NewSymbolWindow.armatureType");
                  break;
               case SymbolType.MC:
                  this._6195.text = tr("NewSymbolWindow.mcType");
                  break;
               case SymbolType.STAGE:
                  this._6195.text = tr("NewSymbolWindow.stageType");
                  if(this._4761._2000)
                  {
                     this._6500.visible = true;
                     this._6500.includeInLayout = true;
                     this._6500.model = this._4761;
                  }
                  this._13397.visible = false;
                  this._13397.includeInLayout = false;
                  break;
               case SymbolType.SHEET:
                  this._6195.text = tr("NewSymbolWindow.sheetType");
            }
            this._6502.text = tr("Property.armature.fps",24);
            this._6499.length = 0;
            _loc1_ = this._4761._1886;
            if(_loc1_)
            {
               _loc2_ = 0;
               _loc3_ = int(_loc1_._13619.length);
               while(_loc2_ < _loc3_)
               {
                  this._6499.push(_loc1_._13619[_loc2_].name);
                  _loc2_++;
               }
            }
            this._6495.source = this._6499;
            this._6496.dataProvider = this._6495;
            if(this._6499.indexOf(_loc1_.defaultAnimation) < 0)
            {
               this._6496._2484 = this._6499[0];
            }
            else
            {
               this._6496._2484 = _loc1_.defaultAnimation;
            }
            this._6498.visible = this._6499.length > 0;
            this._6498.includeInLayout = this._6499.length > 0;
            if(this._6499.length > 0)
            {
               _loc4_ = _loc1_._13656(_loc1_.defaultAnimation);
               if(_loc4_)
               {
                  this._6502.text = tr("Property.armature.fps",_loc4_.frameRate);
               }
            }
         }
      }
      
      private function _6494(param1:Event) : void
      {
         var _loc2_:String = this._6496._2484 as String;
         dispatchEvent(new AnimationEvent(AnimationEvent.MODIFY_ARMATURE_ANIMATION,_loc2_,true));
      }
   }
}

