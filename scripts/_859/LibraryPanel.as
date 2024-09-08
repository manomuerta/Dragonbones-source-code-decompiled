package _859
{
   import _1038._1039;
   import _1038._1042;
   import _127._156;
   import _127._163;
   import _1374.IconButton;
   import _668._670;
   import _692._13549;
   import _692._694;
   import _692._696;
   import _703._702;
   import _703._704;
   import _822._13552;
   import _872._13553;
   import egret.utils.StringUtil;
   import egret.utils.tr;
   import flash.utils.Dictionary;
   
   public class LibraryPanel extends _156 implements _13553
   {
      public var _11321:IconButton;
      
      public var _4196:IconButton;
      
      public var _13792:IconButton;
      
      public var _4197:IconButton;
      
      public var _4190:IconButton;
      
      public var tree:_163;
      
      private var _6362:_670;
      
      public var _13786:_13552;
      
      public function LibraryPanel()
      {
         this.tree = new _163();
         super();
         this.title = tr("LibraryPanel.Title");
         this.icon = "/assets/panel/library.png";
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.tree.top = 22;
         this.tree.percentWidth = 100;
         this.tree.percentHeight = 100;
         this.tree.doubleClickEnabled = true;
         this.tree._5987 = "name";
         this.tree.itemRenderer = _866;
         addElement(this.tree);
         this._5572();
         this._13786 = new _13552(this.tree,this);
         this._13786.percentWidth = 100;
         this._13786._13956 = this._4483;
         addElement(this._13786);
         this._11321 = new IconButton();
         this._11321.icon = "/assets/button/create_symbol.png";
         this._11321.toolTip = tr("LibraryPanel.newSymbol.tip");
         this._13792 = new IconButton();
         this._13792.icon = "/assets/button/create_symbol.png";
         this._13792.toolTip = tr("LibraryPanel.newSymbol.tip");
         this._4196 = new IconButton();
         this._4196.icon = "/assets/button/rename.png";
         this._4196.toolTip = tr("ScenePanel.renameBtn.tooltip");
         this._4197 = new IconButton();
         this._4197.icon = "/assets/button/delAnimation.png";
         this._4197.toolTip = tr("ScenePanel.removeBtn.tooltip");
         this._4190 = new IconButton();
         this._4190.icon = "/assets/button/refresh.png";
         this._4190.toolTip = tr("LibraryPanel.refresh.tip");
         _2527.addElement(this._11321);
         _2527.addElement(this._4190);
         _2527.addElement(this._4197);
      }
      
      private function _3576(param1:Object, param2:Array) : Boolean
      {
         var _loc3_:Boolean = true;
         var _loc4_:int = 0;
         while(_loc4_ < param2.length)
         {
            if(!(param2[_loc4_] is _694) && !(param2[_loc4_] is _13549))
            {
               _loc3_ = false;
               break;
            }
            _loc4_++;
         }
         if(!_loc3_ || !(param1 is _13549))
         {
            return false;
         }
         return true;
      }
      
      private function _3573(param1:Object, param2:Array) : Boolean
      {
         return false;
      }
      
      private function _13959(param1:Array, param2:_702) : Boolean
      {
         var _loc3_:Boolean = true;
         var _loc4_:int = 0;
         while(_loc4_ < param1.length)
         {
            if(param1[_loc4_].parent != param2)
            {
               _loc3_ = false;
               break;
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      private function _5572() : void
      {
         if(this.tree)
         {
            this.tree.dataProvider = !!this._6362 ? this._6362._3997 : null;
            if(this._6362)
            {
               this._6362._3997._4529(this._6362._3997.source);
            }
            this.tree.selectedIndex = -1;
            (this.tree.dataProvider as _1042)._4505 = function(param1:Object):Boolean
            {
               if(!(param1 as _704).visible)
               {
                  return false;
               }
               return true;
            };
         }
      }
      
      public function set _4158(param1:_670) : void
      {
         if(param1 == this._6362)
         {
         }
         this._6362 = param1;
         this._5572();
      }
      
      public function _13955() : _702
      {
         if(this._6362)
         {
            return this._6362._4149._4162;
         }
         return null;
      }
      
      public function _4465() : void
      {
         var _loc1_:_702 = null;
         if(this.tree)
         {
            if(this._6362)
            {
               if(Boolean(this._6362._4149._4162) && this._6362._4149._4162 is _694)
               {
                  this._13786._4471(this._6362._4149);
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
                  this.tree.dataProvider = this._6362._3997;
                  if(this.tree.dataProvider is _1042)
                  {
                     (this.tree.dataProvider as _1042).refresh();
                  }
                  if(this._6362._3997)
                  {
                     _loc1_ = this._6362._3997.getItemAt(0) as _702;
                     if(_loc1_)
                     {
                        this._6362._3997._4529(_loc1_);
                     }
                  }
               }
            }
            else
            {
               this.tree.dataProvider = null;
            }
         }
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
            if(param1.vo && param1.vo.name && !(param1.parent is _694))
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
   }
}

