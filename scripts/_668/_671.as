package _668
{
   import _1374.TabGroup;
   import _1374._1393;
   import _636.DBModelEvent;
   import _648._665;
   import _708._715;
   import _73.SymbolType;
   import _93._95;
   import _944.StagePanel;
   import egret.utils.FileUtil;
   
   public class _671 extends _95 implements _1393
   {
      public var _2873:_715;
      
      public var _2969:Boolean = true;
      
      public var _2968:Boolean = true;
      
      protected var _owner:Object;
      
      protected var _path:String = "";
      
      protected var _3686:String = "";
      
      protected var _data:_665;
      
      public function _671(param1:String)
      {
         super();
         this.path = param1;
      }
      
      public function _5805(param1:DBModelEvent) : void
      {
         if(this.owner)
         {
            (this.owner as TabGroup).dataProvider._4016(this);
         }
      }
      
      public function get _2871() : _665
      {
         return this._data;
      }
      
      public function set _2871(param1:_665) : void
      {
         if(this._data == param1)
         {
            return;
         }
         if(this._data)
         {
            this._data.removeEventListener(DBModelEvent.DATA_CHANGED,this._5805);
            this._2873 = null;
         }
         this._data = param1;
         if(this._data)
         {
            this._data.addEventListener(DBModelEvent.DATA_CHANGED,this._5805);
            switch(param1._2865._1811)
            {
               case SymbolType.ARMATURE:
                  this._2873 = _715.ARMATURE;
                  break;
               case SymbolType.MC:
               case SymbolType.STAGE:
                  this._2873 = _715.GENERAL;
                  break;
               case SymbolType.COMIC:
                  this._2873 = _715.COMIC;
                  break;
               case SymbolType.SHEET:
                  this._2873 = _715.SHEET;
            }
         }
         dispatchEvent(new DBModelEvent(DBModelEvent.DATA_CHANGED));
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._2871 = param1 as _665;
      }
      
      public function get clazz() : Class
      {
         return StagePanel;
      }
      
      public function get path() : String
      {
         return this._path;
      }
      
      public function set path(param1:String) : void
      {
         if(this._path == param1)
         {
            return;
         }
         this._path = param1;
         this._3686 = FileUtil.getFileName(this._path);
      }
      
      public function get owner() : Object
      {
         return this._owner;
      }
      
      public function set owner(param1:Object) : void
      {
         this._owner = param1;
      }
      
      public function get titleToolTip() : String
      {
         return "titleToolTip";
      }
      
      public function get label() : String
      {
         return Boolean(this._2871) && this._2871._3543 ? "*" + this._3686 : this._3686;
      }
      
      public function get icon() : Object
      {
         return null;
      }
      
      public function get fileName() : String
      {
         return this._3686;
      }
   }
}

