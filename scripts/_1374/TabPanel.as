package _1374
{
   import _1045.Group;
   import _1045.SkinnableContainer;
   import _1045._1082;
   import _1177.UIEvent;
   import _1439._1481;
   
   public class TabPanel extends SkinnableContainer implements _1396
   {
      public var _2527:Group;
      
      public var _2569:_1082;
      
      private var _9805:Boolean = false;
      
      private var _2540:int = -1;
      
      private var _icon:Object;
      
      private var _title:String;
      
      protected var _data:Object;
      
      public function TabPanel()
      {
         this._data = {};
         super();
         this.percentHeight = 100;
         this.percentWidth = 100;
         this._2576 = true;
         this.skinName = _1481;
      }
      
      public function get show() : Boolean
      {
         return this._9805;
      }
      
      public function set show(param1:Boolean) : void
      {
         if(param1 == this._9805)
         {
            return;
         }
         this._9805 = param1;
         var _loc2_:UIEvent = new UIEvent(UIEvent.SHOW_CHANGE);
         dispatchEvent(_loc2_);
         this._9804();
      }
      
      protected function _6699() : void
      {
      }
      
      protected function _9804() : void
      {
      }
      
      public function get itemIndex() : int
      {
         return this._2540;
      }
      
      public function set itemIndex(param1:int) : void
      {
         this._2540 = param1;
      }
      
      public function get icon() : Object
      {
         return this._icon;
      }
      
      public function set icon(param1:Object) : void
      {
         this._icon = param1;
         this._data["icon"] = param1;
         this._9757();
      }
      
      public function get title() : String
      {
         if(!this._title && Boolean(this._data["label"]))
         {
            return this._data["label"];
         }
         return this._title;
      }
      
      public function set title(param1:String) : void
      {
         if(this._title == param1)
         {
            return;
         }
         this._title = param1;
         this._data["label"] = param1;
         this._9757();
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
         this._6699();
      }
      
      public function _9757() : void
      {
         if(Boolean(owner) && owner is TabGroup)
         {
            TabGroup(owner).dataProvider._4016(this.data);
         }
      }
   }
}

