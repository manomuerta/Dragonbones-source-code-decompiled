package _785
{
   import _1038._1039;
   import _1038._1042;
   import _1045.Group;
   import _1045.Label;
   import _1185._1189;
   import _1185._1196;
   import _1185._1197;
   import _127._156;
   import _127._163;
   import _13545._13544;
   import _1374.IconButton;
   import _1374.TextInput;
   import _668._667;
   import _703._702;
   import _703._704;
   import _822._13168;
   import _822._13552;
   import _872._13553;
   import egret.utils.StringUtil;
   import egret.utils.tr;
   import flash.utils.Dictionary;
   
   public class AnimationPanel extends _156 implements _13553
   {
      public var tree:_163;
      
      public var _4011:Label;
      
      public var _4010:TextInput;
      
      public var _4009:TextInput;
      
      public var _4020:IconButton;
      
      public var _4008:IconButton;
      
      public var renameBtn:IconButton;
      
      public var _11607:IconButton;
      
      public var _6366:IconButton;
      
      public var _11611:_13168;
      
      public var _4019:IconButton;
      
      private var _4761:_667;
      
      public var _13786:_13552;
      
      public function AnimationPanel()
      {
         this.tree = new _163();
         this._4011 = new Label();
         this._4010 = new TextInput();
         this._4009 = new TextInput();
         this._4020 = new IconButton();
         this._4008 = new IconButton();
         this.renameBtn = new IconButton();
         this._11607 = new IconButton();
         this._6366 = new IconButton();
         this._11611 = new _13168();
         this._4019 = new IconButton();
         super();
         this.title = tr("AnimationPanel.title");
         this.icon = "/assets/panel/animation.png";
      }
      
      override protected function _2438() : void
      {
         var vgroup:Group;
         var hgroup:Group;
         var totalTimeLabel:Label;
         var gapLabel:Label;
         var blendTimeLabel:Label;
         var gapLabel1:Label;
         var playTimesLabel:Label;
         var gapLabel2:Label;
         var editGroup:Group;
         super._2438();
         this._13786 = new _13552(this.tree,this);
         this._13786.percentWidth = 100;
         this._13786._13956 = this._4483;
         this._13786._13954 = true;
         addElement(this._13786);
         this.tree.itemRenderer = _786;
         this.tree.percentWidth = 100;
         this.tree.percentHeight = 100;
         this.tree._5987 = "name";
         this.tree._6033 = this.tree._6031 = true;
         this.tree._3576 = function():Boolean
         {
            return false;
         };
         this.tree._3573 = function():Boolean
         {
            return true;
         };
         vgroup = new Group();
         vgroup.top = 22;
         vgroup.percentWidth = 100;
         vgroup.percentHeight = 100;
         vgroup.layout = new _1197();
         vgroup.addElement(this.tree);
         hgroup = this._2414();
         totalTimeLabel = new Label();
         totalTimeLabel.text = tr("AnimationPanel.totalTime");
         this._4011.percentWidth = 100;
         this._4011.text = "";
         this._4011.enabled = false;
         gapLabel = new Label();
         gapLabel.width = 5;
         hgroup.addElement(gapLabel);
         hgroup.addElement(totalTimeLabel);
         hgroup.addElement(this._4011);
         vgroup.addElement(hgroup);
         hgroup = this._2414();
         blendTimeLabel = new Label();
         blendTimeLabel.text = tr("AnimationPanel.blendTime");
         this._4010.percentWidth = 100;
         this._4010.text = "";
         this._4010.restrict = "0-9.";
         this._4010.maxChars = 4;
         this._4010.enabled = true;
         gapLabel1 = new Label();
         gapLabel1.width = 5;
         hgroup.addElement(gapLabel1);
         hgroup.addElement(blendTimeLabel);
         hgroup.addElement(this._4010);
         vgroup.addElement(hgroup);
         hgroup = this._2414();
         playTimesLabel = new Label();
         playTimesLabel.text = tr("AnimationPanel.playTimes");
         this._4009.percentWidth = 100;
         this._4009.text = "";
         this._4009.enabled = true;
         this._4009.restrict = "0-9";
         this._4009.maxChars = 4;
         gapLabel2 = new Label();
         gapLabel2.width = 5;
         hgroup.addElement(gapLabel2);
         hgroup.addElement(playTimesLabel);
         hgroup.addElement(this._4009);
         vgroup.addElement(hgroup);
         this.addElement(vgroup);
         this._5572();
         editGroup = this._2414();
         editGroup.right = 6;
         this._4020.icon = "/assets/button/addAnimation.png";
         this._4008.icon = "/assets/button/dupAnimation.png";
         this.renameBtn.icon = "/assets/button/rename.png";
         this.renameBtn.toolTip = tr("Animation.renameBtn.tooltip");
         this._4019.icon = "/assets/button/delAnimation.png";
         this._4020.toolTip = tr("Animation.add.tooltip");
         this._4008.toolTip = tr("Animation.duplicate.tooltip");
         this._4019.toolTip = tr("Animation.delete.tooltip");
         this._11607.icon = "/assets/timeline/timeline_delUnnecessary.png";
         this._11607.toolTip = tr("Timeline.delUnnecessary.tooltip");
         this._6366.icon = "/assets/button/importAnim.png";
         this._6366.toolTip = tr("Animation.import.tooltip");
         this._11611.icon = "/assets/button/exportAnim.png";
         this._11611.toolTip = tr("Animation.export.tooltip");
         editGroup.addElement(this._4020);
         editGroup.addElement(this._4008);
         editGroup.addElement(this._6366);
         editGroup.addElement(this._11611);
         editGroup.addElement(this._4019);
         _2527.addElement(editGroup);
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
      
      private function _5572() : void
      {
         if(this.tree)
         {
            this.tree.dataProvider = !!this._4761 ? this._4761._3997 : null;
            if(this._4761)
            {
               this._4761._3997._4505 = this._5986;
            }
            (this.tree.dataProvider as _1042)._4505 = function(param1:Object):Boolean
            {
               if(Boolean(param1 as _13544) && (param1 as _704).visible)
               {
                  return true;
               }
               return false;
            };
         }
      }
      
      private function _5986(param1:Object) : Boolean
      {
         if(param1 is _13544)
         {
            return true;
         }
         return false;
      }
      
      public function get model() : _667
      {
         return this._4761;
      }
      
      public function set model(param1:_667) : void
      {
         this._4761 = param1;
         this._5572();
      }
      
      public function _13955() : _702
      {
         if(this._4761)
         {
            return this._4761._13925();
         }
         return null;
      }
      
      private function _4483(param1:Dictionary) : void
      {
         var fullMatch:Boolean = false;
         var tempsearchContent:String = null;
         var filterNodes:Dictionary = param1;
         var getChildren:Function = function(param1:_702):void
         {
            var _loc2_:int = 0;
            var _loc3_:_702 = null;
            if(param1 is _13544 && param1.vo && Boolean(param1.vo.name))
            {
               _loc2_ = int(StringUtil.trim(param1.vo.name).toLocaleLowerCase().indexOf(tempsearchContent));
               if(_loc2_ >= 0)
               {
                  filterNodes[param1] = true;
                  _13786._4461.push(param1);
                  if(!fullMatch)
                  {
                     _13786._4499 = param1;
                  }
                  fullMatch = true;
               }
            }
            if(param1.children.length)
            {
               for each(_loc3_ in param1.children)
               {
                  getChildren(_loc3_);
               }
            }
         };
         tempsearchContent = this._13786._4511.toLocaleLowerCase();
         if(this._13786._13791)
         {
            getChildren(this._13786._13791);
         }
      }
      
      public function _4465() : void
      {
         if(this.tree)
         {
            if(this._4761)
            {
               if(this._4761._13925())
               {
                  this._13786._4471(this._4761._13925());
               }
               if(StringUtil.trim(this._13786._4511).length)
               {
                  this._13786._4481();
                  if(this.tree.dataProvider is _1042)
                  {
                     (this.tree.dataProvider as _1042).refresh();
                  }
               }
               else
               {
                  this.tree.dataProvider = this._4761._3997;
                  if(this.tree.dataProvider is _1042)
                  {
                     (this.tree.dataProvider as _1042).refresh();
                  }
               }
            }
            else
            {
               this.tree.dataProvider = null;
            }
         }
      }
   }
}

